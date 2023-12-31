import { useState, useRef, useEffect } from 'react';
import { Link, animateScroll as scroll } from 'react-scroll';
import { useParams } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { getRestaurant, fetchRestaurant } from '../../store/restaurants';
import { fetchReviews, getReviewsByRestaurantId } from '../../store/reviews';
// import theready from '../../assets/theready.webp';
import ReservationBox from '../Reservations/ReservationBox';
import ReviewIndex from '../Reviews/ReviewIndex';
import StarAverage from '../Reviews/StarAverage';

function RestaurantShow() {
    const { restaurantId } = useParams();
    const restaurant = useSelector(getRestaurant(restaurantId));
    const dispatch = useDispatch();
    const reviews = useSelector(state => getReviewsByRestaurantId(state, restaurantId));
    const [numOfReviews, setNumOfReviews] = useState(0);
    const [averageRating, setAverageRating] = useState(0);

    const [activeItem, setActiveItem] = useState('overview');
    const overviewRef = useRef(null);
    const reviewsRef = useRef(null);

    useEffect(() => {
        window.scrollTo(0, 0);
      }, []);
    
    useEffect(() => {
        dispatch(fetchRestaurant(restaurantId));
        dispatch(fetchReviews()).then(() => {
            setNumOfReviews(reviews.length);
        });

        const handleScroll = () => {
            const navbarHeight = 50;
            const triggerPoint = window.scrollY + navbarHeight;
        
            if (overviewRef.current && reviewsRef.current) {
                const overviewTop = overviewRef.current.offsetTop;
                const reviewsTop = reviewsRef.current.offsetTop;
        
                if (triggerPoint >= overviewTop && triggerPoint < reviewsTop) {
                    setActiveItem('overview');
                } else if (triggerPoint >= reviewsTop) {
                    setActiveItem('reviews');
                }
            }
        };
        
        
        window.addEventListener('scroll', handleScroll, { passive: true });
        
        return () => window.removeEventListener('scroll', handleScroll);
    }, [restaurantId, dispatch, reviews.length]);

    useEffect(() => {
        if (reviews.length) {
            const total = reviews.reduce((acc, review) => acc + review.overallRating, 0);
            setAverageRating((total / reviews.length).toFixed(1));
        }
    }, [reviews]);

    if (!restaurant) {
        return <div>Loading...</div>;
    }

    return (
        <>
            <img 
                className='show-restaurant-image' 
                src={restaurant.photoUrl}
                // src={theready} 
                alt={`image of ${restaurant.name}`}
            />
            <div className='show-main-content'>
                <div className='show-overview'>
                    <div className='navbar'>
                        <Link
                            to="overview-section"
                            className={activeItem === 'overview' ? 'active' : ''}
                            onClick={() => scroll.scrollTo(overviewRef.current.offsetTop)}
                        >
                            Overview
                        </Link>
                        <Link
                            to="reviews-section"
                            className={activeItem === 'reviews' ? 'active' : ''}
                            onClick={() => scroll.scrollTo(reviewsRef.current.offsetTop)}
                        >
                            Reviews
                        </Link>
                    </div>
                    <div ref={overviewRef}>
                        <div className='show-restaurant-name-container'>
                            <h1 id='show-restaurant-name'>{restaurant.name}</h1>
                        </div>
                        <div className='show-overview-info'>
                            <div className='show-overview-bar'>
                                <div className='show-overview-bar-rating'>
                                    <StarAverage reviews={reviews} />
                                    <span className='show-overview-bar-rating-text'>{averageRating}</span>
                                </div>
                                <i className="fa-sharp fa-light fa-message"></i>
                                <span className='show-overview-bar-attribute'>{numOfReviews} Reviews</span>
                                <i className="fa-sharp fa-light fa-money-bill"></i>
                                <span className='show-overview-bar-attribute'>{restaurant.priceRange}</span>
                                <i className="fa-sharp fa-light fa-plate-utensils"></i>
                                <span className='show-overview-bar-attribute'>{restaurant.cuisine}</span>
                            </div>
                            <p className='show-description'>{restaurant.description}</p>
                        </div>
                    </div>
                    <div ref={reviewsRef} className='show-reviews'>
                        <div id='show-reviews-title-container'>
                            <h2 id='show-reviews-title'>What {numOfReviews} people are saying</h2>
                        </div>
                        <ReviewIndex restaurantId={restaurantId}/>
                    </div>
                </div>
                <div className='sidebar'>
                    <ReservationBox />
                    <div className='show-additional-info'>
                        <h3 id='show-additional-info-title'>Additional information</h3>
                        <ul className='show-additional-info-list'>
                            <li>
                                <div className='show-info-item'>
                                    <span>
                                        <i className="fa-sharp fa-light fa-tree-city"></i>
                                    </span>
                                    <div>
                                        <span>Neighborhood</span>
                                        <div className='show-info-item-text'>{restaurant.neighborhood}</div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div className='show-info-item'>
                                    <span>
                                        <i className="fa-sharp fa-light fa-plate-utensils"></i>
                                    </span>
                                    <div>
                                        <span>Cuisine</span>
                                        <div className='show-info-item-text'>{restaurant.cuisine}</div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div className='show-info-item'>
                                    <span>
                                        <i className="fa-sharp fa-light fa-phone"></i>
                                    </span>
                                    <div>
                                        <span>Phone</span>
                                        <div className='show-info-item-text'>{restaurant.phone}</div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div className='show-info-item'>
                                    <span>
                                        <i className="fa-sharp fa-light fa-browser"></i>
                                    </span>
                                    <div>
                                        <span>Website</span>
                                        <div className='show-info-item-text' id="show-website">{restaurant.websiteUrl}</div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </>
    );
}

export default RestaurantShow;
