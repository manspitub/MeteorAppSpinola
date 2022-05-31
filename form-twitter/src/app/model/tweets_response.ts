export interface Tweets{
    tweets: TweetsResponse[]
}


export interface TweetsResponse {
    id: number
    mensaje: string
    likes: any[]
    user: User
  }
  
  export interface User {
    id: number
    username: string
    descripcion: string
    website: string
    photoUrl: string
    created: string
  }
  