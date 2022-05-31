
export interface FormResponse {
    token: string;
    username: string;
    email: string;
    photoUrl: string;
    created: Date;
    active: boolean;
}

export interface RegisterResponse {
    token: string;
    username: string;
    email: string;
    role: string;
    photoUrl: string;
    created: Date;
    active: boolean;
}
