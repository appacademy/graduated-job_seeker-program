import React from 'react';
import { Route, Link } from 'react-router-dom';

export const ReviewLink = ({ label, to }) => (
  <Route path={to} children={({ match }) => (
    <div>
      {match ? "" : <Link to={to}>{label}</Link>}
    </div>
  )} />
);
