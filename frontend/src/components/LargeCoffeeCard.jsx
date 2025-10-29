import React, { useState, useEffect } from "react";
import PropTypes from "prop-types";
import { Star, Heart } from "lucide-react";
import "./LargeCoffeeCard.css";

const LargeCoffeeCard = ({
  shop,
  isSelected,
  onSelect,
  onToggleFavorite,
  isAuthenticated,
  isFavorite = false,
}) => {
  const [comments, setComments] = useState([]);

  // Fetch comments for the coffee shop when it is selected
  useEffect(() => {
    if (!shop) return;
    fetch(`http://localhost:8080/api/comment/list?coffeeShopId=${shop.id}`)
      .then((res) => res.json())
      .then((data) => setComments(data))
      .catch((err) => console.error("Error fetching comments:", err));
  }, [shop]);

  return (
    <div
      onClick={onSelect}
      className={`large-coffee-card ${isSelected ? "selected" : ""}`}
    >
      <div className="large-coffee-card-content">
        {/* Info Section */}
        <div className="large-coffee-card-info">
          <h2 className="shop-name">{shop.name}</h2>

          {/* Rating Section */}
          <div className="rating-section">
            <div className="rating-stars">
              <Star className="star-icon" />
              <span className="rating-value">
                {shop.rating ? shop.rating.toFixed(1) : "N/A"}
              </span>
            </div>
            <span className="rating-count">
              ({shop.numberOfRatings || 0} reviews)
            </span>
          </div>

          {/* Address Section */}
          <div className="coffee-shop-address">
            <p>{shop.address}</p>
          </div>

          {/* Reviews Section */}
          <div className="reviews-section">
            <h3>Reviews</h3>
            {comments.length > 0 ? (
              <ul className="review-list">
                {comments.map((comment, idx) => (
                  <li key={idx} className="review-item">
                    <strong>{comment.userName}</strong>: {comment.text}
                  </li>
                ))}
              </ul>
            ) : (
              <p>No reviews yet</p>
            )}
          </div>
        </div>
      </div>
    </div>
  );
};

// Prop Types
LargeCoffeeCard.propTypes = {
  shop: PropTypes.shape({
    id: PropTypes.number.isRequired,
    name: PropTypes.string.isRequired,
    lat: PropTypes.number.isRequired,
    lon: PropTypes.number.isRequired,
    rating: PropTypes.number,
    numberOfRatings: PropTypes.number,
    address: PropTypes.string.isRequired,
  }).isRequired,
  isSelected: PropTypes.bool.isRequired,
  onSelect: PropTypes.func.isRequired,
  onToggleFavorite: PropTypes.func.isRequired,
  isAuthenticated: PropTypes.bool.isRequired,
  isFavorite: PropTypes.bool,
};

export default LargeCoffeeCard;