Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC1D277026
	for <sophgo@lists.linux.dev>; Sat,  4 Apr 2026 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775315914; cv=none; b=LhpRYbLMT1vkDiQ9qYofd6AauO9FA7IahwVm/xzJgr630ZklsxhQgRAU+fbG0bbO/QRMj0Hh3AbZ7RKlOeVFC6NNjujRpq/y+VLomNL6+xRlFGQwNOHP0t+SCeSM+1w7Icz40vr/bvwy9OPazPaqoVJOw/5Hbarzd6Lo6NvSjzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775315914; c=relaxed/simple;
	bh=sfics3gcx6ewjjKwTOJ2rCkuCBEKr9GefJzlW0cJEQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0hRNWZe9Mh6/7loao36NNAl7i3zOvDHKJaVLux2/95CiJ6oUo88R+cW3Sn5Oo4TG9IszkhMM1hsJ0xrkzGDJc14ZmGnUT99+g7pshuQf+QlqDrDIs10OEv8DjXMJZhAc5lVB4HhGtxCRGKzkHgfN39dexv1D3GblqXQLvoGPUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m34AcMyJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m34AcMyJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3592C19421;
	Sat,  4 Apr 2026 15:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775315914;
	bh=sfics3gcx6ewjjKwTOJ2rCkuCBEKr9GefJzlW0cJEQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m34AcMyJ0jEtOTzP9OesH/iBIpXGqfXSA/nU28tl7SZvejC4IJTQxodPPy85sJM2K
	 5mkufD9/tjy81w+oPkSd19B+bTst5z/HuMblhTpsU3HNe5O2ri3d2o835npA7iv56V
	 LlRqy4KUcuxhunxaV2kB1FHvfKPiV1BX2NM4Rtf1BHCT3rnjASMxIzEr6fP8ZdDblS
	 XQC0XA8lgBY3QpLBZFRYox5yW4xbf54uaK80waqlB3gSRw40junHAm3YaYqMaP2NIF
	 OqF1ULpuGhSgV/zZZZYLwcDk8I02zgVjvqMZbit3kwoD6ixOx+Kby/t/G66xN5Yxo1
	 YNZ7GdOdttt+Q==
Date: Sat, 4 Apr 2026 17:18:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>, 
	"sophgo@lists.linux.dev" <sophgo@lists.linux.dev>, linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v7.1
Message-ID: <20260404-humongous-mayfly-of-fortitude-5f087f@quoll>
References: <MA5PR01MB1250079A8884D4F6245B955B9FE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <MA5PR01MB1250079A8884D4F6245B955B9FE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>

On Thu, Apr 02, 2026 at 10:39:51AM +0800, Chen Wang wrote:
> Hey Arnd,
> 
> Please pull this dt changes for RISC-V/Sophgo.
> 
> BTW: I'm still waiting for my key to be added into the pgpkeys.git and
> hoping this will not block my PR.
> 
> Thanks,
> 
> Chen
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v7.1
> 
> for you to fetch changes up to 7b159ed9c81cf7e0d0b75666e6548ceface2e1b5:
> 
>   riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel
> number for DMA controller (2026-02-26 06:12:22 +0800)
> 
> ----------------------------------------------------------------
> RISC-V Devicetrees for v7.1
> 
> Sophgo:
> 
> For CV18xx serials:
> Just a minor patch to replace the compatible for
> dma-controller to allow setting DMA channel number.
> New bindings and driver part change are picked by
> DMA subsytem and this patch handles the left dts
> part change.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> 
> ----------------------------------------------------------------
> Inochi Amaoto (1):
>       riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel
> number for DMA controller

Commit has messed DCO chain. I suggest using b4 to handle patches.

Best regards,
Krzysztof

