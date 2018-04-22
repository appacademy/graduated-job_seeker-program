import React from 'react';
import { Link } from 'react-router';

import ReviewShow from './review_show';

const reviewList = (reviews = []) => (
  reviews.map(review => (
    <ReviewShow
      review={review}
      key={review.id}
    />
  ))
);

const BenchDetail = ({ bench }) => {
  return (
    <div>
      <ul className="bench-list">
        <img className="index-image" src={bench.picture_url}/>
        <li>Rating: {bench.average_rating || 'No reviews yet'}</li>
        <li>Description: {bench.description}</li>
        <li>Seats: {bench.seating}</li>
        <li>Latitude: {bench.lat}</li>
        <li>Longitude: {bench.lng}</li>
      </ul>
      <br/>
      <div className="reviews">
        <h3>Reviews</h3>
        {reviewList(bench.reviews)}
      </div>
    </div>
  );
};

export default BenchDetail;
