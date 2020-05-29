import { Controller } from "stimulus";
import * as moment from "moment";
window.moment = moment;
import Tabulator from "tabulator-tables";

export default class extends Controller {
  connect() {
    //define table
    this.table = new Tabulator("#tabulator-players", {
      initialSort:[
        {column:"updated", dir:"desc"}
      ],
      pagination:"local",
      paginationSize: 10, 
      layout: "fitColumns",
      responsiveLayout: "hide",
      columns: [
        {
          title: "",
          field: "favorite",
          formatter: this.favoriteFormatter,
          hozAlign: "center",
          vertAlign: "middle",
          responsive: 0,
          width: "40",
        },
        {
          title: "Ros.",
          field: "id",
          formatter: this.rosterFormatter,
          hozAlign: "center",
          vertAlign: "middle",
          width: "5",
          responsive: 0,
        },
        {
          title: "Update",
          field: "updated",
          formatter: this.updatedFormatter,
          sorter: this.customSorter,
          hozAlign: "center",
          vertAlign: "middle",
          width: "80",
          responsive: 4,
        },
        {
          title: "Name",
          field: "link",
          formatter: "link",
          formatterParams: {
            labelField: "name",
            target: "_blank",
          },
          vertAlign: "middle",
          minWidth: "120",
          responsive: 0,
        },
        {
          title: "Age",
          field: "birthdate",
          formatter: "datetimediff",
          formatterParams: {
            humanize: true,
            invalidPlaceholder: "(invalid date)",
          },
          hozAlign: "center",
          vertAlign: "middle",
          width: "70",
          responsive: 2,
        },
        {
          title: "Height",
          field: "height",
          formatter: this.heightFormatter,
          sorter: this.customSorter,
          hozAlign: "center",
          vertAlign: "middle",
          width: "70",
        },
        {
          title: "Weight",
          field: "weight",
          formatter: this.weightFormatter,
          sorter: this.customSorter,
          hozAlign: "center",
          vertAlign: "middle",
          width: "70",
          responsive: 3,
        },
        {
          title: "Status",
          field: "status",
          width: "75",
          hozAlign: "center",
          vertAlign: "middle",
        },
        {
          title: "Nat.",
          field: "nationality",
          width: "115",
          hozAlign: "center",
          vertAlign: "middle",
          responsive: 3,
        },
        {
          title: "Pos.",
          field: "position",
          formatter: this.positionFormatter,
          sorter: this.customSorter,
          widthGrow: 1,
          hozAlign: "center",
          vertAlign: "middle",
          width: "70",
        },
        {
          title: "Profiles",
          field: "profiles",
          headerSort: false,
          formatter: this.profilesFormatter,
          hozAlign: "center",
          vertAlign: "middle",
          minWidth: "110",
        },
        {
          title: "Salary",
          field: "salary",
          formatter: this.salaryFormatter,
          sorter: this.customSorter,
          hozAlign: "center",
          vertAlign: "middle",
          minWidth: "120",
          responsive: 1,
        },
        {
          title: "Agent",
          field: "agent",
          headerSort: false,
          formatter: this.agentFormatter,
          hozAlign: "center",
          vertAlign: "middle",
          width: "90",
          responsive: 4,
        },
        {
          title: "Last season",
          field: "seasons",
          headerSort: false,
          formatter: this.seasonsFormatter,
          hozAlign: "center",
          vertAlign: "middle",
          responsive: 4,
          minWidth: "150",
        },
        {
          title: "Comments",
          field: "comments",
          formatter: this.commentsFormatter,
          sorter: this.customSorter,
          hozAlign: "center",
          vertAlign: "middle",
          width: "110",
          responsive: 1,
        },
        {
          title: "Priority",
          field: "priority",
          hozAlign: "center",
          vertAlign: "middle",
          width: "110",
          responsive: 3,
        },
        {
          title: "Available",
          field: "available",
          hozAlign: "center",
          vertAlign: "middle",
          width: "120",
          responsive: 4,
        }
      ],
    });

    if(this.data.get('path')){
      this.table.setData(this.data.get('path'));
    }

    window.addEventListener("resize", () => {
      this.table.redraw();
    });
  }

  triggerSearch(e){
    var value = e.target.value;
    this.table.setFilter([
      [
        { field: "name", type: "like", value: value },
        { field: "nationality", type: "like", value: value },
        { field: "status", type: "like", value: value },
        { field: "priority", type: "like", value: value },
        { field: "available", type: "like", value: value },
      ]
    ]);
  }

  updatedFormatter(cell){
    return "<div class='flex fdc'><em>" + cell.getValue().ago + " ago </em><strong> " + cell.getValue().by_user + "</strong></div>"
  }

  favoriteFormatter(cell) {
    if (cell.getValue().value) {
      var valueReturn =
        `<span class='icon has-text-warning' data-controller='favorite' data-favorite-url='` +
        cell.getValue().remove_link +
        `'>
          <i class='fas fa-star' data-action='click->favorite#unfav'></i>
        </span>`;
    } else {
      var valueReturn =
        `<span class='icon' data-controller='favorite' data-favorite-url='` +
        cell.getValue().add_link +
        `'>
          <i class='far fa-star' data-action='click->favorite#fav'></i>
        </span>`;
    }
    return valueReturn
  }

  heightFormatter(cell) {
    return "<div class='flex fdc'>" + cell.getValue().eu + " cm <br/><small>" + cell.getValue().us + " ft</small></div>";
  }

  weightFormatter(cell) {
    return "<div class='flex fdc'>" + cell.getValue().eu + " kg <br/><small>" + cell.getValue().us + " lbs</small></div>";
  }

  agentFormatter(cell) {
    return cell.getValue().eu + " <br/>" + cell.getValue().us;
  }

  positionFormatter(cell) {
    return cell.getValue().short;
  }

  salaryFormatter(cell) {
    if (cell.getValue().real != 0){
      return cell.getValue().real;
    }
    else {
      return cell.getValue().estimation;
    }
  }

  seasonsFormatter(cell) {
    if (cell.getValue()[0]) {
      var season = cell.getValue()[0];
      return "<div class='flex fdc'>" + season.name + " <br/> " + season.country + " <br/> <strong>" + season.team + "</strong></div>";
    }
    return ''
  }

  commentsFormatter(cell) {
    var player_id = cell.getRow()._row.data.id;
    var valueReturn = '<div data-controller="modal"><small data-action="click->modal#open" data-selector="comments_' + player_id + '">' 
                      + cell.getValue().length + " comment(s)</small></div>";

    var commentsList = '<div class="modal-window" id="comments_' + player_id + "\" onclick=\"this.classList.remove('modal-opened')\"> <div style='display: block;'>";
    cell.getValue().forEach((element) => {
      commentsList += '<div class="m-b-xl"><small>' + moment(element.created_at).format('DD/MM/YYYY') + "</small><strong> - " + element.created_by + ' : </strong><p class="p-l-md">' + element.content + "</p></div>";
    });
    commentsList += "</div></div>";

    document.getElementById("tabulator-players-comments").insertAdjacentHTML("beforeend", commentsList);

    return valueReturn
  }

  profilesFormatter(cell) {
    var valueReturn = "<div>";
    cell.getValue().forEach((element) => {
      valueReturn += "<a href='" + element.link + "' class='tag is-info m-xxs'>" + element.name + " </a>"
    });
    valueReturn += "</div>";
    return valueReturn
  }

  rosterFormatter(cell) {
    return `<div data-controller="modal">
        <span class="icon is-medium has-text-success" 
          data-selector="rosters-modal" 
          data-action="click->modal#open click->roster-selection#setPlayer" 
          data-player="` + cell.getValue() + `">
            <i class="fas fa-lg fa-plus-square"></i>
        </span>
      </div>`;
  }

  customSorter(a, b, aRow, bRow, column, dir, sorterParams) {
    var valueReturn = 0;
    switch (column.getField()) {
      case "height":
      case "weight":
        valueReturn = a.eu - b.eu;
        break;

      case "comments":
        valueReturn = a.length - b.length;
        break;

      case "salary":
        valueReturn = a.real - b.real;
        break;

      case "position":
        valueReturn = a.order - b.order;
        break;

      case "updated":
        valueReturn = moment(a.at) - moment(b.at);
        break;

      default:
        break;
    }
    return valueReturn;
  }
}
