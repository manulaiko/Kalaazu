/**
 * Login result type.
 */
import {ApiResponse} from '@/service/api/types';

/**
 * Login endpoint response.
 */
export type LoginResult = ApiResponse<{
    sessionId: string
}>;