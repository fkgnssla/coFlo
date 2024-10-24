import { useState, useEffect } from 'react';
import { useAtom } from 'jotai';
import { currentPageAtom, totalPagesAtom } from '@store/pagination';
import { RepositorySearchBar } from '@components/Repository/RepositorySearchBar';
import { RepositoryItem } from '@components/Repository/RepositoryItem';
import ToggleSwitch from '@components/Repository/ToggleSwitch';
import Pagination from '@components/Pagination/Pagination';
import { Link } from '@apis/Link';
import { GitlabProject } from 'types/gitLab';
import { Modal } from '@components/Modal/Modal';
import { CommonButton } from '@components/Button/CommonButton';
import { useNavigate } from 'react-router-dom';

export default function RepositoryPage() {
  const [currentPage, setCurrentPage] = useAtom(currentPageAtom);
  const [totalPages, setTotalPages] = useAtom(totalPagesAtom);
  const [repositories, setRepositories] = useState<GitlabProject[]>([]);
  const itemsPerPage = 10;
  const [selectedRepo, setSelectedRepo] = useState<GitlabProject | null>(null);
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [inputValue, setInputValue] = useState('');
  const navigate = useNavigate();

  useEffect(() => {
    setCurrentPage(1);
  }, [setCurrentPage]);

  useEffect(() => {
    const fetchProjects = async () => {
      const response = await Link.getLinkRepository('some-keyword', currentPage, itemsPerPage);
      if (response && response.data) {
        setRepositories(response.data.gitlabProjectList);
        setTotalPages(response.data.totalPages);
      }
    };

    fetchProjects();
  }, [currentPage, setTotalPages]);

  const handleToggleChange = (index: number) => {
    const repo = repositories[index];
    if (repo.isLinkable) {
      setRepositories((prev) => {
        const updatedRepos = [...prev];
        updatedRepos[index] = { ...updatedRepos[index], isLinked: !updatedRepos[index].isLinked };
        return updatedRepos;
      });
    } else {
      setSelectedRepo(repo);
      setIsModalOpen(true);
    }
  };

  const handleModalConfirm = async () => {
    if (selectedRepo) {
      await Link.updateRepository(selectedRepo.gitlabProjectId, { token: inputValue });

      setRepositories((prev) => {
        const updatedRepos = [...prev];
        const index = repositories.findIndex(
          (repo) => repo.gitlabProjectId === selectedRepo.gitlabProjectId,
        );
        updatedRepos[index] = { ...updatedRepos[index], isLinked: true, isLinkable: true };
        return updatedRepos;
      });

      setIsModalOpen(false);
      setSelectedRepo(null);
      setInputValue('');
    }
  };

  const handleButtonClick = () => {
    navigate('/main');
  };

  const startIndex = (currentPage - 1) * itemsPerPage;
  const endIndex = startIndex + itemsPerPage;
  const paginatedRepositories = repositories.slice(startIndex, endIndex);

  return (
    <div className="max-w-3xl ml-[80px] p-6">
      <h1 className="text-3xl ml-[20px] font-bold mb-3">Repository</h1>
      <div className="flex items-center justify-between w-[1000px]">
        <h2 className="text-xl mb-3">내 프로젝트에서 리뷰할 프로젝트를 선택합니다.</h2>
        <CommonButton
          className="px-4 w-[100px] h-[50px]"
          active={false}
          onClick={handleButtonClick}
        >
          시작하기
        </CommonButton>
      </div>

      <RepositorySearchBar />

      <div className="bg-white w-[1000px]">
        {paginatedRepositories.map((repo, index) => (
          <div key={startIndex + index}>
            <div className="flex items-center justify-between p-4">
              <RepositoryItem
                name={repo.name}
                integrate={repo.isLinkable ? '' : '프로젝트 토큰이 없습니다'}
              />
              <ToggleSwitch
                checked={repo.isLinked}
                onChange={() => handleToggleChange(startIndex + index)}
              />
            </div>
            {index < paginatedRepositories.length - 1 && (
              <div className="border-t border-gray-300" />
            )}
          </div>
        ))}
      </div>

      {isModalOpen && (
        <Modal
          repo={selectedRepo}
          inputValue={inputValue}
          setInputValue={setInputValue}
          onConfirm={handleModalConfirm}
          onClose={() => {
            setIsModalOpen(false);
            setSelectedRepo(null);
            setInputValue('');
          }}
        />
      )}
      <Pagination />
    </div>
  );
}
