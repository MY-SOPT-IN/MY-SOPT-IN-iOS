# MY-SOPT-IN


</br>

## 👩🏻‍💻  Developers

| 김인영 | 천성우 | 김다예 |
| :-----------------: | :-----: | :-----: |
|![IMG_7518](https://github.com/MY-SOPT-IN/MY-SOPT-IN-iOS/assets/83493636/c9c87ae6-7f7d-4218-bbd7-740f26ec2488) | ![KakaoTalk_Image_2023-05-26-20-34-42](https://github.com/MY-SOPT-IN/MY-SOPT-IN-iOS/assets/83493636/e2e76807-4f6f-4b81-a62c-7570bac8f9e9) |![KakaoTalk_Image_2023-05-26-20-30-12](https://github.com/MY-SOPT-IN/MY-SOPT-IN-iOS/assets/83493636/7a39b5ea-6889-4db9-a7e2-37b757fe4f7b) |
| `프로젝트 세팅, 회고 모아보기` | `루틴 및 메인페이지` | `회고 페이지` |


</br>

## 👀  Simulator


</br>

## 🛠  Development Environment

</br>


#### 🎁 Library

| 라이브러리        | Version | Tool |
| ----------------- | :-----: | ----- |
| Moya           | `15.0` | `SPM` |
| SnapKit           | `5.6.0` | `SPM` |
| Then       | `3.0.0` | `SPM` |


</br>

#### 🗂 Foldering


```bash
├── Network
│   ├── DTO
│   ├── API
│   ├── Router
│   ├── Foundation
│   ├── Config
├── Global
│   ├── Extension
│   ├── Literals
│   ├── UIComponent
│   ├── Resources
├── Presentation
│   ├── RecommendRoutine
│   ├── TabBar
│   ├── RecallPage
│   ├── MainPage

```


</br>

## 🔀  Git Branch

개별 브랜치 관리 및 병합의 안정성을 위해 `Git Forking WorkFlow`를 적용했습니다.

Branch를 생성하기 전 Issue를 먼저 작성하고,

`<Prefix>/#<Issue_Number>` 의 양식에 따라 브랜치 명을 작성합니다.

#### 1️⃣ prefix

- `develop` : feature 브랜치에서 구현된 기능들이 merge될 브랜치. **default 브랜치로 추후에 바꿀 예정.**
- `feature` : 기능을 개발하는 브랜치, 이슈별/작업별로 브랜치를 생성하여 기능을 개발한다
- `main` : 개발이 완료된 산출물이 저장될 공간
- `release` : 릴리즈를 준비하는 브랜치, 릴리즈 직전 QA 기간에 사용한다
- `bug` : 버그를 수정하는 브랜치
- `hotfix` : 정말 급하게, 제출 직전에 에러가 난 경우 사용하는 브렌치

#### 2️⃣ Git forking workflow 적용

1. 팀 프로젝트 repo를 포크한다.(이하 팀 repo)
2. 포크한 개인 repo(이하 개인 repo)를 clone한다.
3. 개인 repo에서 작업하고 개인 repo의 원격저장소로 push한다.
4. pull request를 통해서 팀 repo로 merge한다.
5. pull 받아야 할 때에는 팀 repo에서 pull 받는다.

</br>

## ⚠️  Issue Naming Rule
#### 1️⃣ 기본 형식
`[<PREFIX>] <Description>` 의 양식을 준수하되, Prefix는 협업하며 맞춰가기로 한다.

#### 2️⃣ 예시
```
[Feat] 회원가입 구현
[Fix] MainActivity 버그 수정
```

#### 3️⃣ Prefix의 의미

```bash
[Feat] : 새로운 기능 구현
[Design] : just 화면. 레이아웃 조정
[Fix] : 버그, 오류 해결, 코드 수정
[Add] : Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 새로운 View 생성
[Del] : 쓸모없는 코드, 주석 삭제
[Refactor] : 전면 수정이 있을 때 사용합니다
[Remove] : 파일 삭제
[Chore] : 그 이외의 잡일/ 버전 코드 수정, 패키지 구조 변경, 파일 이동, 파일이름 변경
[Docs] : README나 WIKI 등의 문서 개정
[Comment] : 필요한 주석 추가 및 변경
[Merge] : 머지
```

</br>

## 🍗  Commit Message Convention

#### 1️⃣ 기본 형식
prefix는 Issue에 있는 Prefix와 동일하게 사용한다.
```swift
[prefix] #이슈번호 - 이슈 내용
```

#### 2️⃣ 예시 : 아래와 같이 작성하도록 한다.

```swift
// 1번 이슈에서 새로운 기능(Feat)을 구현한 경우
[Feat] #1 - 기능 구현
// 1번 이슈에서 레이아웃(Design)을 구현한 경우
[Design] #1 - 레이아웃 구현
```

</br>

## 🌀  Code Covention

[StyleShare/swift-style-guide](https://github.com/StyleShare/swift-style-guide) 를 기본으로 따르고 필요에 따라 추가한다.

