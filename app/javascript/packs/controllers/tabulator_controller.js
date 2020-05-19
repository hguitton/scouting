import { Controller } from "stimulus";
import * as moment from 'moment';
window.moment = moment;
import Tabulator from 'tabulator-tables';

export default class extends Controller {
    connect() {
        var jsonData = 'players.json';

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
                { title: "Height", field: "height", formatter: this.formatHeight },
                { title: "Weight", field: "weight", formatter: this.formatWeight },
                { title: "status", field: "status", formatter: this.formatName },
                //{ title: "Nat.", field: "nationality", },
                { title: "Pos.", field: "position", formatter: this.formatName },
                { title: "Profiles", field: "profiles", formatter: this.formatArrayName },
                { title: "Salary", field: "salary_real", },
                //{ title: "Agent", field: "agent", },
                { title: "Last season", field: "seasons", formatter: this.formatSeason },
                { title: "Comments", field: "comments", formatter: this.formatComments },
                //{ title: "Priority", field: "priority", },
                { title: "Available", field: "available", formatter: "tickCross" },
            ]
        });
        table.setData(jsonData);
    }

    formatName(cell, formatterParams, onRendered) {
        var valueReturn = "";
        if (cell.getValue() != null)
            valueReturn = cell.getValue().name;
        return valueReturn
    }

    formatHeight(cell, formatterParams, onRendered) {
        var valueReturn = "";
        if (cell.getValue() != null)
            valueReturn = cell.getValue().height_eu + '<br/>' + cell.getValue().height_us;
        return valueReturn
    }

    formatWeight(cell, formatterParams, onRendered) {
        var valueReturn = "";
        if (cell.getValue() != null)
            valueReturn = cell.getValue().weight_eu + '<br/>' + cell.getValue().weight_us;
        return valueReturn
    }

    formatSeason(cell, formatterParams, onRendered) {
        var valueReturn = "";
        if (cell.getValue() != null) {
            cell.getValue().forEach(element => valueReturn += element.name + ' <br/> ' + element.country + ' <br/> ' + element.team);
        }
        return valueReturn;
    }

    formatArrayName(cell, formatterParams, onRendered) {
        var valueReturn = "";
        if (cell.getValue() != null) {
            cell.getValue().forEach(element => valueReturn += element.name + ' <br/> ');
        }
        return valueReturn;
    }

    formatComments(cell, formatterParams, onRendered) {
        var valueReturn = "";
        if (cell.getValue() != null) {
            valueReturn = '<div data-controller="modal" > <small data-action="click->modal#open">' + cell.getValue().length +
                ' comment(s)</small><div class="modal-window" data-target="modal.modalWindow" data-action="click->modal#close"><div style="display: block;">';
            cell.getValue().forEach(element => {
                valueReturn += '<div class="m-b-xl"><small>' + element.created_at + '</small><strong> -  : </strong><p class="p-l-md">' + element.content + '</p></div>';
            });
            valueReturn += '</div></div></div > ';
        }
        return valueReturn;
    }
}
