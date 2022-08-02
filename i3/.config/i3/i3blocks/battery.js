#!/bin/env node

const { execSync } = require("child_process");

/**
 * @typedef {"Full" | "Charging" | "Discharging"} State
 */

/**
 * @typedef {Object} BatteryInfo
 * @property {number} id
 * @property {number} percent
 * @property {State} state
 */

const STATES = {
    full: "Full",
    charging: "Charging",
    discharging: "Discharging",
};

const COLORS = {
    primary: process.env.color_primary || "#CCCCCC",
    critical: "#FF0000",
    low: "#FFAA00",
    full: "00CC00",
    charge: "#AAAA00",
};

const SYMBOLS = {
    bat0: " ",
    bat1: " ",
    bat2: " ",
    bat3: " ",
    full: " ",
    charge: " ",
};

function getBatteryPercent() {
    const acpiOut = execSync("acpi -b", {
        encoding: "utf-8",
    });
    /** @type {BatteryInfo[]} */
    const batteries = acpiOut
        .split("\n")
        .filter((line) => line.trim())
        .map((line, id) => {
            const split = line.split(",");
            const percent = parseInt(
                (split[1] || "").trim(),
            );
            const state = (
                (split[0] || "").split(":").pop() || ""
            ).trim();
            return { id, percent, state };
        });

    const isCharging = batteries.some(
        ({ state }) => state === STATES.charging,
    );

    const totalPercent = Math.floor(
        batteries.reduce(
            (acc, { percent }) => acc + percent,
            0,
        ) / batteries.length,
    );

    const percentagesFmt =
        (isCharging
            ? SYMBOLS.charge
            : getSymbolForPercent(totalPercent)) +
        batteries
            .map(({ percent }) => percent + "%")
            .join("/");

    const color = isCharging
        ? COLORS.charge
        : getColorForPercent(totalPercent);

    return `${percentagesFmt}\n\n${color}`;
}
/**
 * @param {number} percent
 * @returns {string}
 */
function getSymbolForPercent(percent) {
    const PERCENT_SYMBOL_MAP = [
        [13, SYMBOLS.bat0],
        [38, SYMBOLS.bat1],
        [63, SYMBOLS.bat2],
        [88, SYMBOLS.bat3],
        [200, SYMBOLS.full],
    ];

    return PERCENT_SYMBOL_MAP.find(
        ([max]) => percent < max,
    )[1];
}

function getColorForPercent(percent) {
    const PERCENT_COLOR_MAP = [
        [13, COLORS.critical],
        [38, COLORS.low],
        [88, COLORS.primary],
        [200, COLORS.full],
    ];

    return PERCENT_COLOR_MAP.find(
        ([max]) => percent < max,
    )[1];
}

/**
 * UNUSED
 *
 * @param {BatteryInfo} battery
 * @returns {string}
 */
function formatBattery(battery) {
    const STATE_SYMBOL_MAP = [
        [STATES.full, SYMBOLS.full],
        [STATES.charging, SYMBOLS.charge],
    ];

    const sym =
        battery.state === STATES.discharging
            ? getSymbolForPercent(battery.percent)
            : STATE_SYMBOL_MAP[battery.state];

    return `${sym}${battery.percent}%`;
}

try {
    console.log(getBatteryPercent());
} catch (e) {
    console.error("[Error]", e);
    process.exit(1);
}
