"use strict";

const _ = require("underscore");
const Joi = require("@hapi/joi");
const log = require("../../../util/log");
const Dao = require("../../../util/dao");
const helper = require("../../../util/helper");
const {
  API,
  SCHEMA,
  TABLE,
  CODE,
  FUNCTION,
} = require("../../../util/constant");
const { getCurrentDateFormatted } = require("../../../util/dateHelper");
const { getRouteControllerConfig } = require("../../../util/apiCreateHelper");
const {
  checkUniqueDataFromDB,
} = require("../../../util/dataValidityCheckHelper");


// TODO: DATA FROM SUPPLIER
const payload_scheme = Joi.object({
  supplier_id: Joi.string().required(),
  fi_account_id: Joi.string().required(),
  address_id: Joi.string().required(),
  mother_limit_status_id: Joi.string().required(),
  relationship_manager_id: Joi.string().required(),
  wf_id: Joi.string().required(),
  remarks: Joi.string().required(),
  created_by: Joi.string().required(),
  default_credit_limit: Joi.string().required(),
  default_financing_percentage: Joi.string().required(),
  default_credit_period: Joi.string().required(),
  default_grace_period: Joi.string().required(),
  default_interest_rate: Joi.string().required(),
  default_penalty_rate: Joi.string().required(),
  default_service_charge: Joi.string().required(),
  default_safety_deposit_rate: Joi.string().required(),
  default_disbursement_date: Joi.string().required(),
  is_active: Joi.string().required(),
  start_date: Joi.string().required(),
  end_date: Joi.string().required(),

  buyerList: Joi.array().items(
    Joi.object({
      status: Joi.string().required(),
      end_date: Joi.string().required(),
      buyer_id: Joi.string().required(),
      buyer_onboarding_date: Joi.string().required(),
      financing_percentage: Joi.string().required(),
      anchor_limit: Joi.string().required(),
      credit_period: Joi.string().required(),
      grace_period: Joi.string().required(),
      start_date: Joi.string().required(),
    })
  ),
});

const route_controller = {
  ...getRouteControllerConfig("POST", API.ADD_LIMIT, false, "Add New Limit", {
    payload: payload_scheme,
    allowUnknown: false,
    failCode: 301,
  }),

  handler: async (request, h) => {
    log.debug(`Request received - ${JSON.stringify(request.payload)}`);
    const response = await handle_request(request);
    log.debug(`Response sent - ${JSON.stringify(response)}`);
    return h.response(response);
  },
};

const handle_request = async (request) => {
  let data = await add_limit(request);


  log.info(`Add new Limit`);
  let response = { status: false };
  if (data?.duplicateName)
    return _.extend(response, { code: 409, message: "Duplicate Project name" });
  if (data) {
    return {
      status: true,
      code: 200,
      data: data,
      message: "Add Limit Data Successfully",
    };
  }
  return _.extend(response, { code: 400, message: "Failed To Add Data" });
};


// todo: data for buyer
const add_buyer_limits = async (request, mother_limit_id) => {
  for (let dl of request.payload.buyerList) {
    const {
      status,
      end_date,
      buyer_id:company_id,
      buyer_onboarding_date,
      financing_percentage,
      anchor_limit,
      credit_period,
      grace_period,
      start_date,
    } = dl;

    let sql = {
      text: `INSERT INTO ${SCHEMA.PUBLIC}.${TABLE.ANCHOR_LIMIT} (status,end_date,company_id,buyer_onboarding_date,financing_percentage,anchor_limit,credit_period,grace_period, mother_limit_id,start_date) VALUES($1,$2,$3,$4,$5,$6,$7,$8,$9,$10)`,
      values: [
        status,
        end_date,
        company_id,
        buyer_onboarding_date,
        financing_percentage,
        anchor_limit,
        credit_period,
        grace_period,
        mother_limit_id,
        start_date,
      ],
    };

    try {
      const data = await Dao.get_data(request.pg, sql);
    } catch (e) {
      log.error(`An exception occurred while adding Project : ${e?.message}`);
    }
  }

  return true;
};

const add_limit = async (request) => {
  const {
    supplier_id:company_id,
    fi_account_id,
    address_id,
    mother_limit_status_id,
    relationship_manager_id,
    wf_id,
    remarks,
    created_by,
    default_credit_limit,
    default_financing_percentage,
    default_credit_period,
    default_grace_period,
    default_interest_rate,
    default_penalty_rate,
    default_service_charge,
    default_safety_deposit_rate,
    default_disbursement_date,
    is_active,
    start_date,
    end_date,
  } = request.payload;

  let data = null;

  let sql = {
    text: `select ${SCHEMA.PUBLIC}.create_limit($1)`,
    values: [JSON.stringify(request.payload)],
  };
  try {
    const [{ create_limit: mother_limit_id }] = await Dao.get_data(
      request.pg,
      sql
    );
    await add_buyer_limits(request, mother_limit_id);

    data = true;
  } catch (e) {
    log.error(`An exception occurred while adding Project : ${e?.message}`);
  }
  return data;
};

module.exports = route_controller;
