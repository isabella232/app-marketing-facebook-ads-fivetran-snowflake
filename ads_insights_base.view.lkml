include: "ad_transformations_base.view"
include: "fivetran_base.view"

view: ads_insights_base_fb_adapter {
  extension: required
  extends: [fivetran_base_fb_adapter, ad_transformations_base_fb_adapter]

  dimension: account_id {
    hidden: yes
    type: string
  }

  dimension: account_id_string {
    hidden: yes
    sql: TO_CHAR(${account_id}) ;;
  }

  dimension: account_name {
    type: string
  }

  dimension: ad_id {
    hidden: yes
    type: string
  }

  dimension: ad_name {
    type: string
  }

  dimension: adset_id {
    hidden: yes
    type: string
  }

  dimension: adset_id_string {
    hidden: yes
    sql: TO_CHAR(${adset_id}) ;;
  }

  dimension: adset_name {
    type: string
  }

  dimension: campaign_id {
    hidden: yes
    type: string
  }

  dimension: campaign_id_string {
    hidden: yes
    sql: TO_CHAR(${campaign_id}) ;;
  }

  dimension: campaign_name {
    type: string
  }

  dimension: clicks {
    hidden: yes
    type: number
  }

  dimension: frequency {
    hidden: yes
    type: number
  }

  dimension: impressions {
    hidden: yes
    type: number
  }

  dimension: objective {
    type: string
  }

  dimension: reach {
    hidden: yes
    type: number
  }

  dimension: spend {
    hidden: yes
    type: number
  }

  dimension: total_actions {
    hidden: yes
    type: number
  }
}
