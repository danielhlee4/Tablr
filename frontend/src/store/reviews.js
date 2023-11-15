import csrfFetch from "./csrf";

// Action constant
export const RECEIVE_REVIEWS = 'reviews/RECEIVE_REVIEWS';
export const RECEIVE_REVIEW = 'reviews/RECEIVE_REVIEW';

// Action creators
export const receiveReviews = reviews => ({
    type: RECEIVE_REVIEWS,
    reviews,
});
  
export const receiveReview = review => ({
    type: RECEIVE_REVIEW,
    review,
});

// Selector
export const getReviewsByRestaurantId = (state, restaurantId) => {
    const reviewsArray = Object.values(state.reviews || {});
    const restaurantIdNum = Number(restaurantId);

    const filteredReviews = reviewsArray.filter(review => {
        const reviewRestaurantIdNum = Number(review.restaurantId);
        return reviewRestaurantIdNum === restaurantIdNum;
    });

    return filteredReviews;
};

  
// Thunk action creators
export const fetchReviews = () => async dispatch => {
    const response = await fetch(`/api/reviews`);
    if (response.ok) {
        const reviews = await response.json();
        dispatch(receiveReviews(reviews));
    }
};

export const createReview = reviewData => async dispatch => {
    const response = await csrfFetch(`/api/reviews`, {
        method: 'POST',
        body: JSON.stringify(reviewData),
        headers: { 'Content-Type': 'application/json' }
    });
  
    if (response.ok) {
        const review = await response.json();
        dispatch(receiveReview(review));
    } else {
        const error = await response.json();
        throw new Error(error.errors || "An error occurred");
    }
};

// Reducer
const reviewsReducer = (state = {}, action) => {
    switch (action.type) {
        case RECEIVE_REVIEWS:
            const reviewsById = {};
            action.reviews.forEach(review => {
                reviewsById[review.id] = review;
            });
            return { ...state, ...reviewsById };
        case RECEIVE_REVIEW:
            return { ...state, [action.review.id]: action.review };
        default:
            return state;
    }
};
  
export default reviewsReducer;
