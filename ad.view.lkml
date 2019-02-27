include: "adset.view"
include: "fivetran_base.view"

explore: ad_fb_adapter {
  view_name: ad
  from: ad_fb_adapter
  hidden: yes

  join: adset {
    from: adset_fb_adapter
    type: left_outer
    sql_on: ${ad.adset_id} = ${adset.id} ;;
    relationship: many_to_one
  }

  join: campaign {
    from: campaign_fb_adapter
    type: left_outer
    sql_on: ${ad.campaign_id} = ${campaign.id} ;;
    relationship: many_to_one
  }

  join: account {
    from: account_fb_adapter
    type: left_outer
    sql_on: ${ad.account_id} = ${account.id} ;;
    relationship: many_to_one
  }
}

view: ad_fb_adapter {
  extends: [fivetran_base_fb_adapter, facebook_ads_config]
  sql_table_name: {{ ad.facebook_ads_schema._sql }}.ad_history ;;

  dimension: id {
    hidden: yes
    sql: TO_CHAR(${TABLE}.id) ;;
  }

  dimension: account_id {
    hidden: yes
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: adset_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ad_set_id ;;
  }

  dimension: bid_amount {
    hidden: yes
    type: number
    sql: ${TABLE}.bid_amount ;;
  }

  dimension: bid_type {
    hidden: yes
    type: string
    sql: ${TABLE}.bid_type ;;
  }

  dimension: campaign_id {
    hidden: yes
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: configured_status {
    hidden: yes
    type: string
    sql: ${TABLE}.configured_status ;;
  }

  dimension_group: created {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_time ;;
  }

  dimension: creative_id {
    hidden: yes
    type: number
    sql: ${TABLE}.creative_id ;;
  }

  dimension: effective_status {
    hidden: yes
    type: string
    sql: ${TABLE}.effective_status ;;
  }

  dimension: status_active {
    hidden: yes
    type: yesno
    sql: ${effective_status} = 'ACTIVE' ;;
  }

  dimension: name {
    hidden: yes
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: status {
    hidden: yes
    type: string
    sql: ${TABLE}.status ;;
  }
}
