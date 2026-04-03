Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E77633C19E;
	Fri,  3 Apr 2026 18:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775241043; cv=none; b=BjBsTHDOXMncWvSN2tEJ7W50m+vr2od76S7S5NIxM/haaPJbOqDw2uyBTWXbRXOFDIHMXzOSdDz9XYscVlXkqWR4tjzpn7rWMytP3CQHST643BA3bltnvlKUykZLIotUBioHFrzsvoeD3qdiBFbx2lzWsE0ZscQcNOga0duyYhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775241043; c=relaxed/simple;
	bh=seumy+Ex/xkdEGqEG0CGT2kkxLikn6nOTs522DJNckg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=JF4kPrx056WeKhLn3hz5W3o9BZt1xTa40fCGeB7O9xso7PhxibazbGi9IuXC/LmCuZVpzWr8G2G8+7cuINqVLFfgUwKqIv1gxnCB5T3wsxCF+qU7x/bsjFUZNjgygU0FDz6KTn+rmoA7oG04jcAfEeoOcJYAZdMaB6ynsL8ihLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5Y3EZmA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5Y3EZmA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87E6C2BCB0;
	Fri,  3 Apr 2026 18:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775241040;
	bh=seumy+Ex/xkdEGqEG0CGT2kkxLikn6nOTs522DJNckg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=c5Y3EZmAaJfU0qvwu6OtHikdYU9/ckZeC7ffNJeF4CR+o7CPSTAXhIKj618lgIzLb
	 DS905l5kvPGhtzYxSXSKs5pZxrlUfAFO2Nam0nWpsAa35jhhF0oSlpJToajlEt0n/U
	 cqR6fyHzYpaX/j4ELCh1JV6OMLRBBDwOKuBNfgCuDhb+p5wGk6YB05wVFbcoEhNLsX
	 YHTTKaKCgOx2guDFkfZ6rPXMR2x2yfOYfrffjb//RHSeIHXdyKGJBu/Z0U2NoVyLBf
	 oGufvZSFp8St9ACmCknWEgLZJ5Z4F0kMZiwXW+YQ8g3UTGqICNnR62NgsOl9O987pO
	 CW5sjiBwSpmcA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F933809A14;
	Fri,  3 Apr 2026 18:30:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] riscv: mm: Define DIRECT_MAP_PHYSMEM_END, fix
 ZONE_DEVICE
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177524102228.1406513.593562525700646994.git-patchwork-notify@kernel.org>
Date: Fri, 03 Apr 2026 18:30:22 +0000
References: 
 <20260309-riscv-sparsemem-vmemmap-limits-v1-0-f40efe18e3cd@iscas.ac.cn>
In-Reply-To: 
 <20260309-riscv-sparsemem-vmemmap-limits-v1-0-f40efe18e3cd@iscas.ac.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 alex@ghiti.fr, linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
 stable@vger.kernel.org, gaohan@iscas.ac.cn

Hello:

This series was applied to riscv/linux.git (for-next)
by Paul Walmsley <pjw@kernel.org>:

On Mon, 09 Mar 2026 19:09:36 +0800 you wrote:
> With HSA_AMD_SVM=y, RISC-V runs into the same problem as arm64 at one
> point did [1], where it tries to use a struct page that is outside of
> vmemmap. See log near the end.
> 
> On RISC-V, the actual mappable range of physical addresses is dependent
> on the current MMU mode i.e. satp_mode. Define DIRECT_MAP_PHYSMEM_END to
> expose this information to get_free_mem_region().
> 
> [...]

Here is the summary with links:
  - [1/2] riscv: mm: WARN_ON() for bad addresses in vmemmap_populate()
    https://git.kernel.org/riscv/c/49a5cb2dc86c
  - [2/2] riscv: mm: Define DIRECT_MAP_PHYSMEM_END
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


