import { TestBed } from '@angular/core/testing';

import { ListadoTweetsService } from './listado-tweets.service';

describe('ListadoTweetsService', () => {
  let service: ListadoTweetsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ListadoTweetsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
