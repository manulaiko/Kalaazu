import { ApiResponse } from "@/service/api/types";

/**
 * Login/Register endpoint response.
 */
export type Result = ApiResponse<{
  sessionId: string;
}>;
