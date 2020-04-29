import { ApiResponse } from "@/service/api/types";
import { AccountState } from "@/store/Account/types";

/**
 * Company DTO.
 */
export type Company = ApiResponse<{
  id: number;
  name: string;
  tag: string;
  description: string;
}>;

/**
 * Company list.
 */
export type CompanyList = ApiResponse<Company[]>;