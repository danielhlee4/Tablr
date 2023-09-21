// Action constants and their corresponding actions
export const RECEIVE_RESTAURANTS = 'restaurants/RECEIVE_RESTAURANTS';
export const RECEIVE_RESTAURANT = 'restaurants/RECEIVE_RESTAURANT';

export const receiveRestaurants = restaurants => {
    return {
        type: RECEIVE_RESTAURANTS,
        restaurants
    }
};

export const receiveRestaurant = restaurant => {
    return {
        type: RECEIVE_RESTAURANT,
        restaurant
    }
};

// Selectors
export const getRestaurant = restaurantId => {
    return state => {
        if (state.restaurants) return state.restaurants[restaurantId];
        return null; 
    }
}

export const getRestaurants = state => {
    if (state.restaurants) return Object.values(state.restaurants);
    return [];
}

//thunk action creators
export const fetchRestaurants = () => async dispatch => {
    const res = await fetch('/api/restaurants');

    if (res.ok) {
        const restaurants = await res.json();
        dispatch(receiveRestaurants(restaurants));
    }
}

export const fetchRestaurant = restaurantId => async dispatch => {
    const res = await fetch(`/api/restaurants/${restaurantId}`);

    if (res.ok) {
        const restaurant = await res.json();
        dispatch(receiveRestaurant(restaurant));
    }
}

// Reducer
const restaurantsReducer = (state = {}, action) => {
    const nextState = { ...state }

    switch (action.type) {
        case RECEIVE_RESTAURANTS:
            return { ...action.restaurants };
        case RECEIVE_RESTAURANT:
            nextState[action.restaurant.id] = action.restaurant;
            return nextState;
        default:
            return state;
    }
}

export default restaurantsReducer;