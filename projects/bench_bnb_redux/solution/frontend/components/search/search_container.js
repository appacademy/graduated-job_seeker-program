import { connect } from 'react-redux';

import { updateFilter } from '../../actions/filter_actions';
import { asArray } from '../../reducers/selectors';
import Search from './search';

const mapStateToProps = state => ({
  benches: asArray(state.entities),
  minSeating: state.ui.filters.minSeating,
  maxSeating: state.ui.filters.maxSeating
});

const mapDispatchToProps = dispatch => ({
  updateFilter: (filter, value) => dispatch(updateFilter(filter, value))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Search);
