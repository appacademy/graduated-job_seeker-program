import * as APIUtil from '../util/bench_api_util'

export const RECEIVE_BENCHES = 'RECEIVE_BENCHES';
export const RECEIVE_BENCH = 'RECEIVE_BENCH';
export const RECEIVE_REVIEW = 'RECEIVE_REVIEW';

export const receiveBenches = benches => ({
  type: RECEIVE_BENCHES,
  benches,
});

export const receiveBench = ({ bench, reviews }) => ({
  type: RECEIVE_BENCH,
  bench,
  reviews,
});

export const receiveReview = ({ review, average_rating }) => ({
  type: RECEIVE_REVIEW,
  review,
  average_rating,
});

export const createReview = review => dispatch => (
  APIUtil.createReview(review).then(review => (
    dispatch(receiveReview(review))
  ))
);

export const fetchBenches = filters => dispatch => (
  APIUtil.fetchBenches(filters).then(benches => (
    dispatch(receiveBenches(benches))
  ))
);

export const fetchBench = id => dispatch => (
  APIUtil.fetchBench(id).then(payload => (
    dispatch(receiveBench(payload))
  ))
);

export const createBench = bench => dispatch => (
  APIUtil.createBench(bench).then(bench => (
    dispatch(receiveBench(bench))
  ))
);
