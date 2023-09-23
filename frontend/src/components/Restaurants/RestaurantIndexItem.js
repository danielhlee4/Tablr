import React from 'react';
import { Link } from 'react-router-dom';
import badroman from '../../assets/badroman.webp'

function RestaurantIndexItem({ restaurant }) {
    return (
        <Link to="/" className="restaurant-container">
            <div className="image-container">
                <img src={badroman} alt="Bad Roman"/>
            </div>
            <h2>{restaurant.name}</h2>
            <div className="inline-ratings-reviews">

            </div>
            <div className="inline-description">
                <span>{restaurant.cuisine}</span>
                <span>{restaurant.expense}</span>
                <span>{restaurant.neighborhood}</span>
            </div>
        </Link>
    )
}

export default RestaurantIndexItem;