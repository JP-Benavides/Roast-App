package roast.repositories;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.time.Duration;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

@Component
public class RedisRepository {
    
    private final RedisTemplate<String, Object> redisTemplate;
    private final ConcurrentHashMap<String, AtomicInteger> hitCounts = new ConcurrentHashMap<>();
    
    public RedisRepository(RedisTemplate<String, Object> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }
    
    /**
     * Calculate adaptive TTL based on hit frequency
     */
    public Duration calculateAdaptiveTTL(String cacheKey, Duration baseTTL) {
        AtomicInteger counter = hitCounts.get(cacheKey);
        int hitCount = (counter != null) ? counter.get() : 0;
        
        // Adaptive TTL logic
        if (hitCount >= 20) {
            // Very popular: 4x base TTL
            return baseTTL.multipliedBy(4);
        } else if (hitCount >= 10) {
            // Popular: 2x base TTL  
            return baseTTL.multipliedBy(2);
        } else if (hitCount >= 5) {
            // Moderate: 1.5x base TTL
            return baseTTL.multipliedBy(3).dividedBy(2);
        } else {
            // Low usage: base TTL
            return baseTTL;
        }
    }
    
    /**
     * Record a cache hit
     */
    public void recordHit(String cacheKey) {
        AtomicInteger counter = hitCounts.get(cacheKey);
        if (counter == null) {
            hitCounts.put(cacheKey, new AtomicInteger(1));
        } else {
            counter.incrementAndGet();
        }
    }
    
    /**
     * Get hit count for a cache key
     */
    public int getHitCount(String cacheKey) {
        return hitCounts.getOrDefault(cacheKey, new AtomicInteger(0)).get();
    }
    
    /**
     * Reset hit counts (call periodically to avoid memory issues)
     */
    public void resetHitCounts() {
        hitCounts.clear();
    }
    
    /**
     * Set custom TTL for a specific cache entry
     */
    public void setCacheWithAdaptiveTTL(String cacheName, String key, Object value, Duration baseTTL) {
        String fullKey = cacheName + "::" + key;
        Duration adaptiveTTL = calculateAdaptiveTTL(fullKey, baseTTL);
        
        redisTemplate.opsForValue().set(fullKey, value, adaptiveTTL);
        System.out.println("🔥 Cached '" + key + "' with adaptive TTL: " + adaptiveTTL.toMinutes() + " minutes (hits: " + getHitCount(fullKey) + ")");
    }
}