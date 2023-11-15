import React, { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import ReviewIndexItem from './ReviewIndexItem';
import { fetchReviews, getReviewsByRestaurantId } from '../../store/reviews';
import './ReviewIndex.css';

const ReviewIndex = ({ restaurantId }) => {
  const dispatch = useDispatch();
  const reviews = useSelector(state => getReviewsByRestaurantId(state, restaurantId));
  console.log('reviews:', reviews)

  useEffect(() => {
    dispatch(fetchReviews());
  }, [dispatch]);

  if (!reviews) {
    return <div>Loading reviews...</div>;
  }

  if (reviews.length === 0) {
    return <div>No reviews found.</div>;
  }

  return (
    <div className="review-index">
      {reviews.map((review) => (
        <ReviewIndexItem key={review.id} review={review} />
      ))}
    </div>
  );
};

export default ReviewIndex;
