Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571427;
	b=iH55DOXPcWPvLR+kadKqPsXHCIlY0WI+m1ecOFQPrKKedc2tAA88vq3cWv8M9cIws1rz
	 1GDxZA7x+2woOhs1Dtde4UDzGhNvA5AlVh96fZQKJ2T8HqO2i3jVo6iaeVNpU/fOQePR2
	 4y1X2R4ybkxBptqP4iAROabsxCiWOFxwixQdIBzzgBpbzIkHr2Ouu5nxvcWXWCFtvvES4
	 o9bPxTE7bjTdZFpfdW7999kUkdASqccXWstRgQ5/ENcUhvY2676OjzQ+OPAco+9EOZLHK
	 e1/jtNz/6vxf2huyPtJfg45BHR7fsJk+wDBYs40u02LQeg8u2MhkxTxfO2sZg6mIsgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571427;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=pABWBHR6n+up2I9bsewaTlF6DKSaIiqbqtQFSLN20TA=;
	b=Z9bCAzt7NC/28T9+cxF0Uk3ocqyCZ5hK3y3Nv412vLrvTqULkO/h1gtWbw6BX3bNjDMV
	 oWkM7+bupxlC84IVPU12+HwO/JrDNhiPX0N9fGvwvj7ImA1LSJqc+3QNKZoxz46lNZBhK
	 2GxHtSpU4z3r+Y/2ltqX3rHfsFa17I3Cxqd3SldtdB14XJdSgvXxpTgw/wmrt9XRQIt/v
	 rHHVQZAaE7OlHmD4EcXSm7hGjTsN2STL7SsfPd2G5prA6GEtIJOf46BbPbtjqzUh71hSB
	 +pwMRaICcZIFurLd9XD+NHGk17m4Jm8OpjMUfz8Z45OxNjJ4tlyAhp4VlkXmgHt23ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="E4IJhKC/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BCB6074139
	for <sophgo@lists.linux.dev>; Sun,  1 Nov 2026 22:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E4IJhKC/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44141F000C1;
	Sun,  1 Nov 2026 22:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571426;
	bh=pABWBHR6n+up2I9bsewaTlF6DKSaIiqbqtQFSLN20TA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=E4IJhKC/2Gm5SNOrDSZdjkrzCnmP6i9DgWi4yHtr2px/rWfBfrXoPUU0oWHORzvxH
	 bj8BYLoxYLEfRTMGEpwOkkO9EkcyIPRheuyqq7wJqeLRHh6W7MAxwCc+XAet85nVaX
	 YEqRtXYorAv045u6KSbq7DQTS1IdaSXIJ3LZi7lRfL9u4QKI9QDkezu5qfJIQYSJEi
	 b3ydJC9uRHOyhfNMqECILA0kUohpVp8rP2Nt3rTzunadNlsE1wdDarp4lAaggxVnTP
	 K2HUyDWJWOHqi2QJSUki5PcRfk1Rtva7PEWGuJcXcrYGG5GNxSnbpBQ8JwCNvqHnhX
	 F++ZNWC8c9P+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA14B38003B8;
	Sun,  1 Nov 2026 22:17:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v7.4
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357142529.2624073.15824616848622379697.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:17:05 +0000
References: <aff6ff25-8969-4a35-9543-9113afb2e003@linux.dev>
In-Reply-To: <aff6ff25-8969-4a35-9543-9113afb2e003@linux.dev>
To: Chen Wang <chen.wang@linux.dev>
Cc: linux-riscv@lists.infradead.org, soc@kernel.org, arnd@arndb.de,
 conor+dt@kernel.org, inochiama@gmail.com, sophgo@lists.linux.dev,
 gaohan@iscas.ac.cn, lihangfan@iscas.ac.cn, chenyou910331@gmail.com,
 andrey.lalaev@gmail.com

Hello:

This pull request was applied to riscv/linux.git (fixes)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Fri, 9 Oct 2026 17:23:58 +0800 you wrote:
> Hey Arnd,
> 
> Please pull this dt changes for RISC-V/Sophgo.
> 
> Thanks,
> 
> Chen
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo Devicetrees for v7.4
    https://git.kernel.org/riscv/c/5d299ec9395e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


