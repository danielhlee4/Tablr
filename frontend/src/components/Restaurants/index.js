import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import RestaurantIndexItem from './RestaurantIndexItem';
import { getRestaurants, fetchRestaurants } from '../../store/restaurants';

function RestaurantIndex() {
    const restaurants = useSelector(getRestaurants);
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchRestaurants());
    }, [dispatch]);

    return (
        <>
            <h1>Time to eat</h1>
            <ul>
                {restaurants.map(restaurant => {
                    return <RestaurantIndexItem key={restaurant.id} restaurant={restaurant} />
                })}
            </ul>
        </>
    );
};

export default RestaurantIndex;