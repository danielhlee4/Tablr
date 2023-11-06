// Action constant
export const RECEIVE_REVIEWS = 'reviews/RECEIVE_REVIEWS';

// Action
export const receiveReviews = (restaurantId, reviews) => {
    return {
        type: RECEIVE_REVIEWS,
        restaurantId,
        reviews,
    };
};

// Selector
export const getReviewsByRestaurantId = (state, restaurantId) => {
    return state.restaurants[restaurantId]?.reviews || [];
};

// Thunk action creator
export const fetchReviews = restaurantId => async dispatch => {
    const res = await fetch(`/api/restaurants/${restaurantId}/reviews`);

    if (res.ok) {
        const reviews = await res.json();
        dispatch(receiveReviews(restaurantId, reviews));
    }
};

// Reducer
const reviewsReducer = (state = {}, action) => {
    switch (action.type) {
        case RECEIVE_REVIEWS:
            const nextState = { ...state };
            nextState[action.restaurantId] = {
                ...nextState[action.restaurantId],
                reviews: action.reviews,
            };
            return nextState;
        default:
            return state;
    }
  };
  
  export default reviewsReducer;