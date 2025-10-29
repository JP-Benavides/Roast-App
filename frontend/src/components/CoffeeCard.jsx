import React from "react";
import { Star, Heart } from "lucide-react";
import PropTypes from "prop-types";
import "./CoffeeCard.css";
import "./LargeCoffeeCard.css";

const CoffeeCard = ({
  shop,
  isSelected,
  onSelect,
  onToggleFavorite,
  isAuthenticated,
  isFavorite = false,
}) => {

  return (
    <div
      onClick={(e) => {
        e.stopPropagation();
        onSelect(shop);
      }}
      className={`coffee-card ${isSelected ? 'selected' : ''}`}
    >
      {/* Card Layout */}
      <div className="coffee-card-content">
        {/* Image Section */}
        <div className="coffee-card-image">
          <div className="coffee-icon">
            <span className="coffee-emoji">☕</span>
          </div>
          {isAuthenticated && (
            <button
              onClick={(e) => {
                e.stopPropagation();
                onToggleFavorite();
              }}
              className={`favorite-btn ${isFavorite ? 'favorited' : ''}`}
            >
              <Heart className="favorite-icon" style={{ fill: isFavorite ? "#ffffffff" : "#aa2e2ea0" }}/>
            </button>
          )}
        </div>

        {/* Info Section */}
        <div className="coffee-card-info">
          <div>
            <div className="shop-name">
              {shop.name}
            </div>

            {/* Rating */}
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
          </div>
        </div>
      </div>
    </div>
  );
};

CoffeeCard.propTypes = {
  shop: PropTypes.shape({
    id: PropTypes.number.isRequired,
    name: PropTypes.string.isRequired,
    lat: PropTypes.number.isRequired,
    lon: PropTypes.number.isRequired,
    rating: PropTypes.number,
    numberOfRatings: PropTypes.number,
  }).isRequired,
  isSelected: PropTypes.bool.isRequired,
  onSelect: PropTypes.func.isRequired,
  onToggleFavorite: PropTypes.func.isRequired,
  isAuthenticated: PropTypes.bool.isRequired,
  isFavorite: PropTypes.bool,
};


export default CoffeeCard; 