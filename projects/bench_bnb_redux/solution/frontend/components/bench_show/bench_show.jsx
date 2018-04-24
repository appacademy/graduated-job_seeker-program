import React from 'react';
import { Link } from 'react-router-dom';

import BenchDetail from './bench_detail';
import BenchMap from '../bench_map/bench_map';
import ReviewFormContainer from './review_form_container';
import { ProtectedRoute } from '../../util/route_util';
import { ReviewLink } from '../../util/link_util';

const BenchShow = ({ bench, benchId, fetchBench }) => {
  const benches = {
    [benchId]: bench
  };

  return(
    <div className="single-bench-show">
      <div className="single-bench-map">
        <Link to="/">Back to Benches Index</Link>
        <BenchMap
          benches={benches}
          benchId={benchId}
          singleBench={true}
          fetchBench={fetchBench}
        />
      </div>
      <div className="right-half bench-details">
        <BenchDetail bench={bench} />
        <ReviewLink
          component={ReviewFormContainer}
          to={`/benches/${benchId}/review`}
          label="Leave a Review"
        />
        <ProtectedRoute
          path="/benches/:benchId/review"
          component={ReviewFormContainer}
        />
      </div>
    </div>
  );
};

export default BenchShow;
