<script>
    document.getElementById("searchForm").addEventListener("submit", function(event) {
    event.preventDefault(); // 기본 폼 제출 방지

    // 검색어 가져오기
    const searchQuery = document.getElementById("searchInput").value;

    // 검색어를 도메인 주소에 추가하여 리다이렉트
    if (searchQuery) {
    window.location.href = "/search?query=" + encodeURIComponent(searchQuery);
}
});
</script>
