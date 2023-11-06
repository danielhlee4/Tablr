import csrfFetch from "./csrf";

// Action constant
export const RECEIVE_REVIEWS = 'reviews/RECEIVE_REVIEWS';
export const RECEIVE_REVIEW = 'reviews/RECEIVE_REVIEW';

// Action
export const receiveReviews = (restaurantId, reviews) => {
    return {
        type: RECEIVE_REVIEWS,
        restaurantId,
        reviews,
    };
};

export const receiveReview = (restaurantId, review) => {
    return {
        type: RECEIVE_REVIEW,
        restaurantId,
        review
    };
};

// Selector
export const getReviewsByRestaurantId = (state, restaurantId) => {
    return state.restaurants[restaurantId]?.reviews || [];
};

export const getReview = (state, restaurantId) => {
    return state.reviews && state.reviews[restaurantId] ? state.reviews[restaurantId] : null;
};

// Thunk action creator
export const fetchReviews = restaurantId => async dispatch => {
    const res = await fetch(`/api/restaurants/${restaurantId}/reviews`);

    if (res.ok) {
        const reviews = await res.json();
        dispatch(receiveReviews(restaurantId, reviews));
    }
};

export const createReview = (restaurantId, reviewData) => async (dispatch) => {
    const res = await csrfFetch(`/api/restaurants/${restaurantId}/reviews`, {
        method: 'POST',
        body: JSON.stringify(reviewData),
        headers: { 'Content-Type': 'application/json' }
    });
  
    const data = await res.json();
  
    if (res.ok) {
        dispatch(receiveReview(restaurantId, data));
    }
    return res;
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
        case RECEIVE_REVIEW:
            const restaurantId = action.restaurantId;
            const review = action.review;

            return {
                ...state,
                [restaurantId]: {
                    ...state[restaurantId],
                    reviews: state[restaurantId]?.reviews
                        ? [...state[restaurantId].reviews, review]
                        : [review],
                },
            };
        default:
            return state;
    }
  };
  
  export default reviewsReducer;