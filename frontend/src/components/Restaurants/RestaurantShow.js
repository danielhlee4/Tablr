import { useEffect } from 'react';
import { useParams } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { getRestaurant, fetchRestaurant } from '../../store/restaurants';
import theready from '../../assets/theready.webp';

function RestaurantShow() {
    const { restaurantId } = useParams();
    const restaurant = useSelector(getRestaurant(restaurantId));
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchRestaurant(restaurantId));
    }, [restaurantId, dispatch]);

    if (!restaurant) {
        return <div>Loading...</div>;
    }

    return (
        <>
            <img className='show-restaurant-image' src={theready} alt={restaurant.name} />
            <div className='show-main-content'>
                <div className='show-overview'>
                    <h1>{restaurant.name}</h1>
                    <div className='show-overview-info'>
                        <span>Rating</span>
                        <span>Num Reviews</span>
                        <span>{restaurant.priceRange}</span>
                        <span>{restaurant.cuisine}</span>
                    </div>
                    <h2 className='show-reviews'>What 42 people are saying</h2>
                </div>
                <div className='show-additional-info'>
                    
                </div>
            </div>
        </>
    );
}

export default RestaurantShow;
