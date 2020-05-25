import { Controller } from "stimulus";
import * as moment from "moment";
window.moment = moment;
import Tabulator from "tabulator-tables";

export default class extends Controller {
  connect() {
    //define table
    var table = new Tabulator("#tabulator-players", {
      columns: [
        {
          title: "Fav.",
          field: "favorite",
          formatter: this.customFormatter,
        },
        {
          title: "Last update",
          field: "updated_at",
          formatter: "datetimediff",
          formatterParams: {
            humanize: true,
            invalidPlaceholder: "(invalid date)",
          },
        },
        {
          title: "Name",
          field: "link",
          formatter: "link",
          formatterParams: {
            labelField: "name",
            target: "_blank",
          },
        },
        {
          title: "Age",
          field: "birthdate",
          formatter: "datetimediff",
          formatterParams: {
            inputFormat: "DD-MM-YYYY",
            humanize: true,
            invalidPlaceholder: "(invalid date)",
          },
        },
        {
          title: "Height",
          field: "height",
          formatter: this.customFormatter,
          sorter: this.customSorter,
        },
        {
          title: "Weight",
          field: "weight",
          formatter: this.customFormatter,
          sorter: this.customSorter,
        },
        { title: "Status", field: "status" },
        { title: "Nat.", field: "nationality" },
        {
          title: "Pos.",
          field: "position",
          formatter: this.customFormatter,
          sorter: this.customSorter,
        },
        {
          title: "Profiles",
          field: "profiles",
          headerSort: false,
          formatter: this.customFormatter,
        },
        {
          title: "Salary",
          field: "salary",
          formatter: this.customFormatter,
          sorter: this.customSorter,
        },
        {
          title: "Agent",
          field: "agent",
          headerSort: false,
          formatter: this.customFormatter,
        },
        {
          title: "Last season",
          field: "seasons",
          headerSort: false,
          formatter: this.customFormatter,
        },
        {
          title: "Comments",
          field: "comments",
          formatter: this.customFormatter,
          sorter: this.customSorter,
        },
        { title: "Priority", field: "priority" },
        { title: "Available", field: "available" },
      ],
      responsiveLayout:"collapse",
    });
    // define URL data json
    table.setData("players.json");
  }

  customFormatter(cell, formatterParams, onRendered) {
    var valueReturn = "";
    if (cell.getValue() != null) {
      switch (cell.getField()) {
        case "favorite":
          if(cell.getValue().value){
            valueReturn = 
              `<span class='icon has-text-warning' data-controller='favorite' data-favorite-url='`+ cell.getValue().remove_link +`'>
                <i class='fas fa-star' data-action='click->favorite#unfav'></i>
              </span>`
          }else{
            valueReturn = 
              `<span class='icon' data-controller='favorite' data-favorite-url='`+ cell.getValue().add_link +`'>
                <i class='far fa-star' data-action='click->favorite#fav'></i>
              </span>`
          }
        break;
        case "height":
          valueReturn =
            cell.getValue().eu + " cm <br/><small>" + cell.getValue().us + " ft</small>";
          break;

        case "weight":
          valueReturn =
            cell.getValue().eu + " kg <br/><small>" + cell.getValue().us + " lbs</small>";
          break;

        case "agent":
          valueReturn = cell.getValue().eu + " <br/>" + cell.getValue().us;
          break;

        case "position":
          valueReturn = cell.getValue().short;
          break;

        case "salary":
          if (cell.getValue().real != 0) valueReturn = cell.getValue().real;
          else valueReturn = cell.getValue().estimation;
          break;

        case "seasons":
          cell
            .getValue()
            .forEach(
              (element) =>
                (valueReturn +=
                  element.name +
                  " <br/> " +
                  element.country +
                  " <br/> " +
                  element.team)
            );
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
          cell
            .getValue()
            .forEach((element) => (valueReturn += "<a href='" + element.link + "' class='tag is-info m-xxs'>" + element.name + " </a> "));
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
