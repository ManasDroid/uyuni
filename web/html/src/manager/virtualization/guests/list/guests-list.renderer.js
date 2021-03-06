const SpaRenderer  = require("core/spa/spa-renderer").default;
const React = require('react');
const { GuestsList } = require('./guests-list');

export const renderer = (id, { serverId, pageSize, saltEntitled, foreignEntitled, isAdmin }) => {
  SpaRenderer.renderNavigationReact(
    <GuestsList
      serverId={serverId}
      pageSize={pageSize}
      saltEntitled={saltEntitled}
      foreignEntitled={foreignEntitled}
      isAdmin={isAdmin}
    />,
    document.getElementById(id),
  );
};
