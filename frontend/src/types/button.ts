interface BtnProps {
  active?: boolean;
  icon?: React.ReactNode;
  children?: React.ReactNode;
  className?: string;
  onClick?: React.MouseEventHandler<HTMLDivElement>;
  bgColor?: string;
  hoverColor?: string;
}

interface LabelColors {
  [key: string]: { bgColor: string };
}
