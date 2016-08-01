"use strict";

const React = require("react");
const ReactDOM = require("react-dom");
const MessageContainer = require("../components/messages").Messages;
const {Table, Column, SearchField, Highlight} = require("../components/table");
const Network = require("../utils/network");
const Functions = require("../utils/functions");
const Utils = Functions.Utils;

const TaskoTop = React.createClass({

  getInitialState: function() {
    return {
      serverData: null,
      error: null,
    };
  },

  componentWillMount: function() {
    this.refreshServerData();
    setInterval(this.refreshServerData, this.props.refreshInterval);
  },

  refreshServerData: function() {
    var currentObject = this;
    Network.get("/rhn/manager/schedule/taskotop/data", "application/json").promise
      .then(data => {
        currentObject.setState({
          serverData: data,
          error: null,
        });
      })
      .catch(response => {
        currentObject.setState({
          error: response.status == 401 ? "authentication" :
            response.status >= 500 ? "general" :
            null
        });
      });
  },

  sortByStatus: function(aRaw, bRaw, columnKey, sortDirection) {
    var statusValues = {'running': 0, 'ready_to_run': 1, 'failed': 2, 'interrupted': 3, 'skipped': 4, 'finished': 5 };
    var a = statusValues[aRaw[columnKey]];
    var b = statusValues[bRaw[columnKey]];
    var result = a > b ? 1 : (a < b ? -1 : 0);
    return (result || Utils.sortById(aRaw, bRaw)) * sortDirection;
  },

  searchData: function(datum, criteria) {
      if (criteria) {
        return datum.name.toLowerCase().includes(criteria.toLowerCase());
      }
      return true;
  },

  decodeStatus: function(status) {
    var cell;
    switch(status) {
      case 'running': cell = <div><i className="fa fa-cog fa-spin"></i>{t(' running')}</div>; break;
      case 'finished': cell = <div className="text-success"><i className="fa fa-thumbs-o-up"></i>{t(' finished')}</div>; break;
      case 'failed': cell = <div className="text-danger"><i className="fa fa-exclamation-triangle"></i>{t(' failed')}</div>; break;
      case 'interrupted': cell = <div className="text-warning"><i className="fa fa-stop"></i>{t(' interrupted')}</div>; break;
      case 'ready_to_run': cell = <div className="text-primary"><i className="fa fa-list-ul"></i>{t(' ready to run')}</div>; break;
      case 'skipped': cell = <div className="text-muted"><i className="fa fa-angle-double-right"></i>{t(' skipped')}</div>; break;
      default: cell = null;
    }
    return cell;
  },

  buildRows: function(jobs) {
    return Object.keys(jobs).map((id) => jobs[id]);
  },

  render: function() {
    const data = this.state.serverData;
    if (data != null && Object.keys(data).length > 0) {
      return  (
        <div key="taskotop-content">
          <div className="spacewalk-toolbar-h1">
            <h1><i className="fa fa-gears"></i>{t("TaskoTop")}</h1>
            <ErrorMessage error={this.state.error} />
            <p>{t('Taskomatic is running or has finished executing the following tasks during the latest 5 minutes.')}</p>
            <p>{t('Data are refreshed every ')}{this.props.refreshInterval/1000}{t(' seconds')}</p>
          </div>
          <Table
            data={this.buildRows(data)}
            identifier={(row) => row["id"]}
            cssClassFunction={(row) => row["status"] == 'skipped' ? 'text-muted' : null }
            initialSortColumnKey="status"
            searchField={
                <SearchField filter={this.searchData}
                    criteria={""}
                    placeholder={t("Filter by name")} />
            }>
            <Column
              columnKey="id"
              comparator={Utils.sortById}
              header={t("Task Id")}
              cell={ (row) => row["id"] }
            />
            <Column
              columnKey="name"
              comparator={Utils.sortByText}
              header={t("Task Name")}
              cell={ (row) => row["name"] }
            />
            <Column
              columnKey="startTime"
              comparator={Utils.sortByText}
              header={t("Start Time")}
              cell={ (row) => moment(row["startTime"]).format("HH:mm:ss") }
            />
            <Column
              columnKey="endTime"
              comparator={Utils.sortByText}
              header={t("End Time")}
              cell={ (row) => row["endTime"] == null ? "" : moment(row["endTime"]).format("HH:mm:ss") }
            />
            <Column
              columnKey="elapsedTime"
              // comparator={this.sortByText}
              header={t("Elapsed Time")}
              cell={ (row) => row["elapsedTime"] == null ? "" : row["elapsedTime"] + ' seconds' }
            />
            <Column
              columnKey="status"
              comparator={this.sortByStatus}
              header={t("Status")}
              cell={ (row) => this.decodeStatus(row["status"]) }
            />
            <Column
              columnKey="data"
              // comparator={this.sortByText}
              header={t("Data")}
              cell={ (row) => row["data"].map((c, index) => <div key={"data-" + index}>{c}</div>) }
            />
          </Table>
        </div>
      );
    }
    else {
      return (
        <div key="taskotop-no-content">
          <div className="spacewalk-toolbar-h1">
            <h1><i className="fa fa-tasks"></i>{t("TaskoTop")}</h1>
            <p>{t('Taskomatic is not running any tasks at the moment.')}</p>
          </div>
        </div>
      );
    }
  }
});

const ErrorMessage = (props) => <MessageContainer items={
    props.error == "authentication" ?
      MessagesUtils.warning(t("Session expired, please reload the page to see up-to-date data.")) :
    props.error == "general" ?
      MessagesUtils.warning(t("Server error, please check log files.")) :
    []
  } />
;

ReactDOM.render(
  <TaskoTop refreshInterval={5 * 1000} />,
  document.getElementById("taskotop")
);
