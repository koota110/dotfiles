Vim�UnDo� �w���_�2��"��b��BA}kMa�@u �   %                 &       &   &   &    _�Kk    _�                             ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �                <<<<<<< HEAD5�_�                    &        ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &          =======5�_�                    &        ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &          export type GetLETResponse = {5�_�                    &       ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &          	  lets: [5�_�                    &       ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &              {5�_�                    &       ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &          $      /* eslint-disable camelcase */5�_�                    &       ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &                id: string;5�_�      	              &       ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &                 tpm_serial_number: string;5�_�      
           	   &       ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &          +      case_serial_number: Nullable<string>;5�_�   	              
   &       ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &          *      wired_mac_address: Nullable<string>;5�_�   
                 &       ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &          -      wireless_mac_address: Nullable<string>;5�_�                    &       ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &          .      bluetooth_mac_address: Nullable<string>;5�_�                    &       ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &                bpdid: Nullable<string>;5�_�                    &       ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &                business: Business;5�_�                    &       ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &                plant: Plant;5�_�                    &       ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &                division: Division;5�_�                    &       ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &                certifiable: boolean;5�_�                    &       ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &                 management_status: string;5�_�                    &       ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &                group_id: string;5�_�                    &       ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &          $      terminal_id: Nullable<string>;5�_�                    &       ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &                running_status: string;5�_�                    &       ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &                 online: Nullable<boolean>;5�_�                    &       ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &          )      last_modified_time: Nullable<Date>;5�_�                    &       ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &          #      generation: Nullable<string>;5�_�                    &       ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &                /* eslint-enable */5�_�                    &       ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &              }5�_�                    &       ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &            ];5�_�                    &        ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   %   &          };5�_�                   &        ����                                                                                                                                                    #                                                                                                                                                                                                        _�5�     �   &   *   (    �   &   '   (    5�_�                     '       ����                                                                                                                                                    #                                                                                                                                                                                                        _�5�    �   &   (   +      $export interface CreateLETResponse {5�_�      !               *        ����                                                                                                                                                    #                                                                                                                                                                                                        _�5�    �   )   *          +type MaintainLETsResponse = GetLETResponse;5�_�       "           !   *        ����                                                                                                                                                    #                                                                                                                                                                                                        _�5�    �   )   *          7>>>>>>> 823d0d9... create maintenance api response #8945�_�   !   #           "           ����                                                                                                                                                    #                                                                                                                                                                                                        _�9�     �               )   import {     BusinessCodeName,     PlantNumberName,     DivisionNumberNameCategory   } from '~/types/lets/common';   )import { Nullable } from '~/types/types';       export interface LETResponse {      /* eslint-disable camelcase */     id: string;     tpm_serial_number: string;   '  case_serial_number: Nullable<string>;   &  wired_mac_address: Nullable<string>;   )  wireless_mac_address: Nullable<string>;   *  bluetooth_mac_address: Nullable<string>;     bpdid: Nullable<string>;     business: BusinessCodeName;     plant: PlantNumberName;   '  division: DivisionNumberNameCategory;     certifiable: boolean;     management_status: string;     group_id: string;      terminal_id: Nullable<string>;     running_status: string;     online: Nullable<boolean>;   %  last_modified_time: Nullable<Date>;     generation: Nullable<string>;     /* eslint-enable */   }       !export interface GetLETResponse {     lets: LETResponse[];   }       $export interface CreateLETResponse {     lets: LETResponse[];   }       'export interface MaintainLETsResponse {     lets: LETResponse[];   }5�_�   "   $           #           ����                                                                                                                                                    #                                                                                                                                                                                                        _�:s     �               )   import {     BusinessCodeName,     PlantNumberName,     DivisionNumberNameCategory   } from '~/types/lets/common';   )import { Nullable } from '~/types/types';       export interface LETResponse {      /* eslint-disable camelcase */     id: string;     tpm_serial_number: string;   '  case_serial_number: Nullable<string>;   &  wired_mac_address: Nullable<string>;   )  wireless_mac_address: Nullable<string>;   *  bluetooth_mac_address: Nullable<string>;     bpdid: Nullable<string>;     business: BusinessCodeName;     plant: PlantNumberName;   '  division: DivisionNumberNameCategory;     certifiable: boolean;     management_status: string;     group_id: string;      terminal_id: Nullable<string>;     running_status: string;     online: Nullable<boolean>;   %  last_modified_time: Nullable<Date>;     generation: Nullable<string>;     /* eslint-enable */   }       !export interface GetLETResponse {     lets: LETResponse[];   }       $export interface CreateLETResponse {     lets: LETResponse[];   }       'export interface MaintainLETsResponse {     lets: LETResponse[];   }5�_�   #   %           $           ����                                                                                                                                                    #                                                                                                                                                                                                        _�;�     �                  &import { Business } from './business';   !import { Plant } from './plants';   &import { Division } from './division';   )import { Nullable } from '~/types/types';       export type GetLETResponse = {   	  lets: [       {   $      /* eslint-disable camelcase */         id: string;          tpm_serial_number: string;   +      case_serial_number: Nullable<string>;   *      wired_mac_address: Nullable<string>;   -      wireless_mac_address: Nullable<string>;   .      bluetooth_mac_address: Nullable<string>;         bpdid: Nullable<string>;         business: Business;         plant: Plant;         division: Division;         certifiable: boolean;          management_status: string;         group_id: string;   $      terminal_id: Nullable<string>;         running_status: string;          online: Nullable<boolean>;   )      last_modified_time: Nullable<Date>;   #      generation: Nullable<string>;         /* eslint-enable */       }     ];   };5�_�   $   &           %           ����                                                                                                                                                    #                                                                                                                                                                                                        _�=�     �               %   import {     BusinessCodeName,     PlantNumberName,     DivisionNumberNameCategory   } from '~/types/lets/common';   )import { Nullable } from '~/types/types';       export interface LETResponse {      /* eslint-disable camelcase */     id: string;     tpm_serial_number: string;   '  case_serial_number: Nullable<string>;   &  wired_mac_address: Nullable<string>;   )  wireless_mac_address: Nullable<string>;   *  bluetooth_mac_address: Nullable<string>;     bpdid: Nullable<string>;     business: BusinessCodeName;     plant: PlantNumberName;   '  division: DivisionNumberNameCategory;     certifiable: boolean;     management_status: string;     group_id: string;      terminal_id: Nullable<string>;     running_status: string;     online: Nullable<boolean>;   %  last_modified_time: Nullable<Date>;     generation: Nullable<string>;     /* eslint-enable */   }       !export interface GetLETResponse {     lets: LETResponse[];   }       $export interface CreateLETResponse {     lets: LETResponse[];   }5�_�   %               &           ����                                                                                                                                                    #                                                                                                                                                                                                        _�Kj     �               )   import {     BusinessCodeName,     PlantNumberName,     DivisionNumberNameCategory   } from '~/types/lets/common';   )import { Nullable } from '~/types/types';       export interface LETResponse {      /* eslint-disable camelcase */     id: string;     tpm_serial_number: string;   '  case_serial_number: Nullable<string>;   &  wired_mac_address: Nullable<string>;   )  wireless_mac_address: Nullable<string>;   *  bluetooth_mac_address: Nullable<string>;     bpdid: Nullable<string>;     business: BusinessCodeName;     plant: PlantNumberName;   '  division: DivisionNumberNameCategory;     certifiable: boolean;     management_status: string;     group_id: string;      terminal_id: Nullable<string>;     running_status: string;     online: Nullable<boolean>;   %  last_modified_time: Nullable<Date>;     generation: Nullable<string>;     /* eslint-enable */   }       !export interface GetLETResponse {     lets: LETResponse[];   }       $export interface CreateLETResponse {     lets: LETResponse[];   }       'export interface MaintainLETsResponse {     lets: LETResponse[];   }5�_�                    %        ����                                                                                                                                                       
                                                                                                                                                                                                    _�5�     �   $   '        5��