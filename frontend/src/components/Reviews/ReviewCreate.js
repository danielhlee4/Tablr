import React, { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { useParams } from 'react-router-dom';
import StarRating from './StarRating';
import { createReview } from '../../store/reviews';
import { getReservation } from '../../store/reservations';
import './Reviews.css';

function ReviewCreate() {
    const { reservationId } = useParams()
    const reservation = useSelector(state => getReservation(reservationId)(state));
    const restaurantId = 1;
    const dispatch = useDispatch();
    const [reviewBody, setReviewBody] = useState('');
    const [ratings, setRatings] = useState({
        overallRating: 0,
        foodRating: 0,
        serviceRating: 0,
        ambianceRating: 0,
        valueRating: 0,
    });

    const changeRating = (category, newRating) => {
        setRatings({ ...ratings, [category]: newRating });
    };

    const handleSubmit = (e) => {
        e.preventDefault();

        const reviewData = {
            review: {
                ...ratings,
                body: reviewBody,
                reservationId,
            }
        };
        dispatch(createReview(restaurantId, reviewData));
    };

    return(
        <form onSubmit={handleSubmit}>
            <StarRating category="Overall" onChangeRating={changeRating} />
            <StarRating category="Food" onChangeRating={changeRating} />
            <StarRating category="Service" onChangeRating={changeRating} />
            <StarRating category="Ambiance" onChangeRating={changeRating} />
            <StarRating category="Value" onChangeRating={changeRating} />
            <textarea
                className="review-textarea"
                value={reviewBody}
                onChange={(e) => setReviewBody(e.target.value)}
                placeholder="Your review must be at least 10 characters"
                minLength="10"
                required
            />
            <button type="submit" className="submit-review-btn">Submit</button>
        </form>
    )
}

export default ReviewCreate;