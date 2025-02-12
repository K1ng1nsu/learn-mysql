CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name , address)
);

insert into companies VALUES ('name1','add1'),('name2','add2');

SELECT *
FROM companies;

-- 열 추가하기
ALTER TABLE companies
ADD COLUMN phone VARCHAR(15);

ALTER TABLE companies
ADD COLUMN employee_count INT not null; -- not null이면 숫자는 기본값 0 문자는 기본값 '',    DEFAULT로 정해줄 수도 있음 => ADD COLUMN employee_count INT NOT NULL DEFAULT 1;

-- 열 삭제하기
ALTER TABLE companies
DROP COLUMN phone;

ALTER TABLE companies
DROP COLUMN employee_count;

-- 열 이름 변경
ALTER TABLE companies
RENAME COLUMN name TO company_name;

-- 테이블 이름 변경
#1
RENAME TABLE companies to suppliers;
#2
ALTER TABLE suppliers 
RENAME TO companies;

-- 열 수정하기 (자료형)
ALTER TABLE companies
MODIFY company_name VARCHAR(100) DEFAULT 'unknown';

-- 열 수정하기 (자료형, 이름 동시에)
ALTER TABLE companies
CHANGE company_name biz_name VARCHAR(50);

-- 제약조건 추가, 삭제
ALTER TABLE houses 
ADD CONSTRAINT positive_pprice CHECK (purchase_price >= 0);

ALTER TABLE houses 
DROP CONSTRAINT positive_pprice;



