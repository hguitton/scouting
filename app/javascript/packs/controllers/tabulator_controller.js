import { Controller } from "stimulus";
import * as moment from 'moment';
window.moment = moment;
import Tabulator from 'tabulator-tables';

export default class extends Controller {
    connect() {
        //define table
        var table = new Tabulator("#bob", {
            columns: [
                {
                    title: "Last update", field: "updated_at", formatter: "datetimediff", formatterParams: {
                        //inputFormat: "YYYY-MM-DD",
                        humanize: true,
                        invalidPlaceholder: "(invalid date)",
                    }
                },
                { title: "Name", field: "name", },
                {
                    title: "Age", field: "birthdate", formatter: "datetimediff", formatterParams: {
                        inputFormat: "DD-MM-YYYY",
                        humanize: true,
                        invalidPlaceholder: "(invalid date)",
                    }
                },
                { title: "Height", field: "height", formatter: this.customFormatter, sorter: this.customSorter },
                { title: "Weight", field: "weight", formatter: this.customFormatter, sorter: this.customSorter },
                { title: "status", field: "status", },
                { title: "Nat.", field: "nationality", },
                { title: "Pos.", field: "position", formatter: this.customFormatter, sorter: this.customSorter },
                { title: "Profiles", field: "profiles", headerSort: false, formatter: this.customFormatter },
                { title: "Salary", field: "salary", formatter: this.customFormatter, sorter: this.customSorter },
                { title: "Agent", field: "agent", },
                { title: "Last season", field: "seasons", headerSort: false, formatter: this.customFormatter },
                { title: "Comments", field: "comments", formatter: this.customFormatter, sorter: this.customSorter },
                { title: "Priority", field: "priority", },
                { title: "Available", field: "available", },
            ]
        });
        // define URL data json
        table.setData('players.json');
    }

    customFormatter(cell, formatterParams, onRendered) {
        var valueReturn = "";
        if (cell.getValue() != null) {
            switch (cell.getField()) {
                case "height":
                    valueReturn = cell.getValue().eu + ' cm <br/>' + cell.getValue().us + ' ft';
                    break;

                case "weight":
                    valueReturn = cell.getValue().eu + ' kg <br/>' + cell.getValue().us + ' lbs';
                    break;

                case "position":
                    valueReturn = cell.getValue().name;
                    break;

                case "salary":
                    valueReturn = cell.getValue().real + '<br/>' + cell.getValue().estimation;
                    break;

                case "seasons":
                    cell.getValue().forEach(element => valueReturn += element.name + ' <br/> ' + element.country + ' <br/> ' + element.team);
                    break;

                case "comments":
                    valueReturn = '<div data-controller="modal" > <small data-action="click->modal#open">' + cell.getValue().length +
                        ' comment(s)</small><div class="modal-window" data-target="modal.modalWindow" data-action="click->modal#close"><div style="display: block;">';
                    cell.getValue().forEach(element => {
                        valueReturn += '<div class="m-b-xl"><small>' + element.created_at + '</small><strong> -  : </strong><p class="p-l-md">' + element.content + '</p></div>';
                    });
                    valueReturn += '</div></div></div > ';
                    break;

                case "profiles":
                    cell.getValue().forEach(element => valueReturn += element.name + ' <br/> ');
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
            case "height": case "weight":
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
