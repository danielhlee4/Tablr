import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import badroman from '../../assets/badroman.webp'

function RestaurantIndexItem({ restaurant }) {
    const [isRaised, setIsRaised] = useState(false);
    const [isClicked, setIsClicked] = useState(false);

    const handleMouseEnter = () => {
        setIsRaised(true);
    };
    
    const handleMouseLeave = () => {
        setIsRaised(false);
    };
    
    const handleClick = () => {
        setIsClicked(!isClicked);
    };

    const containerClasses = `restaurant-container ${isRaised ? 'raised' : ''} ${isClicked ? 'clicked' : ''}`;

    return (
        <Link 
            to="/"
            className={containerClasses}
            onMouseEnter={handleMouseEnter}
            onMouseLeave={handleMouseLeave}
            onClick={handleClick}
        >
            <div className="image-container">
                <img 
                    src={badroman}
                    alt={restaurant.name}
                />
            </div>
            <div className="text-container">
                <h2 id="restaurant-name">{restaurant.name}</h2>
                <div>Rating / Reviews placeholder</div>
                <div className="inline-ratings-reviews">

                </div>
                <div className="inline-description">
                    <span>{restaurant.cuisine}</span>
                    <span className="expense-container">
                        <span className={restaurant.expense.length >= 1 ? "active" : "inactive"}>$</span>
                        <span className={restaurant.expense.length >= 2 ? "active" : "inactive"}>$</span>
                        <span className={restaurant.expense.length >= 3 ? "active" : "inactive"}>$</span>
                        <span className={restaurant.expense.length >= 4 ? "active" : "inactive"}>$</span>
                    </span>
                    <span>{restaurant.neighborhood}</span>
                </div>
                <div>
                    Reservations placeholder
                </div>
            </div>
        </Link>
    )
}

export default RestaurantIndexItem;