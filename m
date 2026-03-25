Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CA934DB6D;
	Wed, 25 Mar 2026 23:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774480316; cv=none; b=etNthYmOSOwwxRrmlve5V6jnuPLJBaBufiao54pQfQ1KRXVDrr6+YvK2wchOYDIZmWLW/xSrfYwi1qzy/7ssSVZLYFDSp3g/v3pvildLncqWEk0ojfUpvPoYSCz53mTwy0OJAh25MJ+fnaz3lIjM2RQPXNaTBtG/xub84SKI+Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774480316; c=relaxed/simple;
	bh=CoijEhfKP+7uttDnMp7Oa/n8h7udRADYfzNGBzWJsXo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XoF4ZxW0dgTINFTuL/VXLzh/qJW7U+MZnFDyBWivY5K2VNbDZYZLmpJ4Mux3RIPCpFWuW2rzE4lhP9SWOq8liyRH+m08swyk6N+Uqds+0w9S74j9Gmd5q8BjF6ydBPNv8Ectrc/weX2x714gMYFSZRYGJ5bWBiZfwH6+MsTlIBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JSICdvC/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JSICdvC/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E52C4CEF7;
	Wed, 25 Mar 2026 23:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774480315;
	bh=CoijEhfKP+7uttDnMp7Oa/n8h7udRADYfzNGBzWJsXo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JSICdvC/ABLFDEu5oxvRjGHOX5cDUiKMklZCoJLd03zB4V46S8spvkA3e2ksCY/qE
	 MQnoHY97e9ZZ6sKgbLsgs4nDjWJu4skL+qVXm6KBT979IuNlhQ9icH7gV3g2azqpjD
	 gxnFxGjHBR0HVblgMkPcEOmDDpmKMTmKHY0cZBxRwiP5+jkPlYBNlSd4q44E0AntvU
	 Sm1UAnwaeFJuSarID4fZe5h3vham7bdPdnyIJilVoG+PVdxCjYRS/nbDZAGKuzMAOO
	 U45tRYJEgEeMPX4o1hq69+kgj4+/x+umjuloH1Mb1MQE4ewAXufW5576aczn+wOBan
	 f185K/n2WNBLw==
Date: Wed, 25 Mar 2026 17:11:54 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, sophgo@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: mm: WARN_ON() for bad addresses in
 vmemmap_populate()
In-Reply-To: <20260309-riscv-sparsemem-vmemmap-limits-v1-1-f40efe18e3cd@iscas.ac.cn>
Message-ID: <305ca5f3-3f07-05b2-e1ee-38da86a64a26@kernel.org>
References: <20260309-riscv-sparsemem-vmemmap-limits-v1-0-f40efe18e3cd@iscas.ac.cn> <20260309-riscv-sparsemem-vmemmap-limits-v1-1-f40efe18e3cd@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Mar 2026, Vivian Wang wrote:

> Similarly to the same check in arch/arm64/mm/mmu.c, in
> vmemmap_populate(), add a warning for start and end being outside of the
> range of vmemmap.
> 
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

Thanks, queued for v7.1.


- Paul
