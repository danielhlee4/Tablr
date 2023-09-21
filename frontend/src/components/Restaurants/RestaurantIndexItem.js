import React from 'react';

function RestaurantIndexItem({ restaurant }) {
    return (
        <>
            <h2>{restaurant.name}</h2>
            <p>{restaurant.cuisine}</p>
            <p>{restaurant.neighborhood}</p>
        </>
    )
}

export default RestaurantIndexItem;