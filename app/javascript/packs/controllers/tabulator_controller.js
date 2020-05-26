import { Controller } from "stimulus";
import * as moment from "moment";
window.moment = moment;
import Tabulator from "tabulator-tables";

export default class extends Controller {
  connect() {
    //define table
    var table = new Tabulator("#tabulator-players", {
      layout: "fitColumns",
      responsiveLayout: "hide",
      columns: [
        {
          title: "",
          field: "favorite",
          formatter: this.customFormatter,
          hozAlign: "center",
          vertAlign: "middle",
          responsive: 0,
          width: "40",
        },
        {
          title: "Update",
          field: "updated_at",
          formatter: "datetimediff",
          formatterParams: {
            humanize: true,
            invalidPlaceholder: "(invalid date)",
            suffix: true,
          },
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
          width: "10%",
          minWidth: "100",
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
          formatter: this.customFormatter,
          sorter: this.customSorter,
          width: "70",
        },
        {
          title: "Weight",
          field: "weight",
          formatter: this.customFormatter,
          sorter: this.customSorter,
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
          formatter: this.customFormatter,
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
          formatter: this.customFormatter,
          hozAlign: "center",
          vertAlign: "middle",
          minWidth: "100",
        },
        {
          title: "Salary",
          field: "salary",
          formatter: this.customFormatter,
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
          formatter: this.customFormatter,
          hozAlign: "center",
          vertAlign: "middle",
          width: "90",
          responsive: 4,
        },
        {
          title: "Last season",
          field: "seasons",
          headerSort: false,
          formatter: this.customFormatter,
          responsive: 4,
          minWidth: "150",
        },
        {
          title: "Comments",
          field: "comments",
          formatter: this.customFormatter,
          sorter: this.customSorter,
          hozAlign: "center",
          vertAlign: "middle",
          minWidth: "90",
          responsive: 1,
        },
        {
          title: "Priority",
          field: "priority",
          hozAlign: "center",
          vertAlign: "middle",
          minWidth: "80",
          responsive: 3,
        },
        {
          title: "Available",
          field: "available",
          hozAlign: "center",
          vertAlign: "middle",
          minWidth: "80",
          responsive: 4,
        },
        {
          title: "Ros.",
          field: "id",
          formatter: this.customFormatter,
          hozAlign: "center",
          vertAlign: "middle",
          minWidth: "15",
          responsive: 0,
        },
      ],
    });
    // define URL data json
    table.setData("players.json");

    window.addEventListener("resize", function () {
      table.redraw();
    });
  }

  customFormatter(cell, formatterParams, onRendered) {
    var valueReturn = "";
    if (cell.getValue() != null) {
      console.log(cell.getField());
      switch (cell.getField()) {
        case "favorite":
          if (cell.getValue().value) {
            valueReturn =
              `<span class='icon has-text-warning' data-controller='favorite' data-favorite-url='` +
              cell.getValue().remove_link +
              `'>
                <i class='fas fa-star' data-action='click->favorite#unfav'></i>
              </span>`;
          } else {
            valueReturn =
              `<span class='icon' data-controller='favorite' data-favorite-url='` +
              cell.getValue().add_link +
              `'>
                <i class='far fa-star' data-action='click->favorite#fav'></i>
              </span>`;
          }
          break;
        case "height":
          valueReturn =
            cell.getValue().eu +
            " cm <br/><small>" +
            cell.getValue().us +
            " ft</small>";
          break;

        case "weight":
          valueReturn =
            cell.getValue().eu +
            " kg <br/><small>" +
            cell.getValue().us +
            " lbs</small>";
          break;

        case "agent":
          valueReturn = cell.getValue().eu + " <br/>" + cell.getValue().us;
          break;

        case "position":
          valueReturn = cell.getValue().short;
          break;

        case "bob":
          console.log("COUCOUCOUCOUC");
          valueReturn = cell.getField();
          break;

        case "salary":
          if (cell.getValue().real != 0) valueReturn = cell.getValue().real;
          else valueReturn = cell.getValue().estimation;
          break;

        case "seasons":
          if (cell.getValue()[0]) {
            var season = cell.getValue()[0];
            valueReturn =
              season.name +
              " <br/> " +
              season.country +
              " <br/> <strong>" +
              season.team +
              "</strong>";
          }
          break;

        case "comments":
          valueReturn =
            '<div data-controller="modal" > <small data-action="click->modal#open">' +
            cell.getValue().length +
            ' comment(s)</small><div class="modal-window" data-target="modal.modalWindow" data-action="click->modal#close"><div style="display: block;">';
          cell.getValue().forEach((element) => {
            valueReturn +=
              '<div class="m-b-xl"><small>' +
              element.created_at +
              '</small><strong> -  : </strong><p class="p-l-md">' +
              element.content +
              "</p></div>";
          });
          valueReturn += "</div></div></div > ";
          break;

        case "profiles":
          valueReturn = "<div class='flex fdc'>";
          cell
            .getValue()
            .forEach(
              (element) =>
                (valueReturn +=
                  "<a href='" +
                  element.link +
                  "' class='tag is-info m-xxs'>" +
                  element.name +
                  " </a>")
            );
          valueReturn += "</div>";
          break;
        case "id":
          valueReturn =
            `
            <div data-controller="modal">
              <span class="icon is-medium has-text-success" 
                data-selector="rosters-modal" 
                data-action="click->modal#open click->roster-selection#setPlayer" 
                data-player="` + cell.getValue()+`">
              <i class="fas fa-lg fa-plus-square"></i></span></div>`;

          break;
        default:
          valueReturn = "error : " + cell.getField();
          break;
      }
    }
    return valueReturn;
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

      default:
        break;
    }
    return valueReturn;
  }
}
