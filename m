Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AD417A305
	for <sophgo@lists.linux.dev>; Wed,  5 Aug 2026 01:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785891837; cv=none; b=D09wPbktXsaywLGRB8+th6359q2RXHTj8hX+1zcgGJYxsVt5hL5vqS/DLH/fBvII+WsAfswfeS2+qQUkFRcUwTyp4k7arG0xRHOzZH8cAirEnmX8dyimiQJFf4l/UMKgVWlHyM3HBT/jfHTZ5uK0w6CwRssVR0p4VP/IyjSf8S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785891837; c=relaxed/simple;
	bh=C8Y/UE1bV8wvX6QUhsbHXdcLmjze0e3X2TD0H0wAKAM=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:From:
	 In-Reply-To:Content-Type; b=sUk24dTx/keYxRE/rOMzI/MJ2aNDLAlVRYaqVVQyIuMOhThnvt60YbwflHmdsts6f4fRusBk8IaJ1V0BySs3u6Jdr8h6BqUmL1VhsmE3tt8Pb1LQGRLcHFX6Ta/KZwlxobsJKtj7UOcGaXfWUyZJj/+3XZl05wzzTv1fZR6yrHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Dj6s6RGv; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Dj6s6RGv"
Message-ID: <9daba6e5-fa82-4ed9-b9f2-078dacec46f0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785891834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=75+IBgOkbpOuyaflGqyC4oREEL7VqHt7A2MtxgwvRd0=;
	b=Dj6s6RGvaCK4YReyTTrzr8Y88zxE3RdRLkByegoC1dQy9MhVcoJg9EDGtqUg39vCyF+64/
	E9y67uOn+22GtcG3D9W7WT3OqtqfiOd2mNVuPfcKYqQubC41I1+m7SrXcmFP/lcNQ0/dIx
	es9umHiE1YCVLoukahttVzQGGpW/W+I=
Date: Wed, 5 Aug 2026 09:03:28 +0800
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Fwd: [GIT PULL] RISC-V Sophgo Devicetrees for v7.3
References: <1333a916-da71-432d-99ae-69cdb6061add@linux.dev>
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <1333a916-da71-432d-99ae-69cdb6061add@linux.dev>
X-Forwarded-Message-Id: <1333a916-da71-432d-99ae-69cdb6061add@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

I'm forwarding this because I noticed the previous email was rejected by 
the mailing list—I'm not sure why.



-------- Forwarded Message --------
Subject: 	[GIT PULL] RISC-V Sophgo Devicetrees for v7.3
Date: 	Wed, 5 Aug 2026 08:52:02 +0800
From: 	Chen Wang <chen.wang@linux.dev>
To: 	soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
CC: 	Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto 
<inochiama@gmail.com>, sophgo@lists.linux.dev <sophgo@lists.linux.dev>, 
linux-riscv <linux-riscv@lists.infradead.org>, Chen Wang 
<chen.wang@linux.dev>, Joshua Milas <josh.milas@gmail.com>, Chen-Yu Yeh 
<chenyou910331@gmail.com>



Hey Arnd,

Please pull this dt changes for RISC-V/Sophgo.

Thanks,

Chen

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v7.3

for you to fetch changes up to 59c682ffc76ebda27ecbbbd1423e23ec482d61b9:

   riscv: dts: sophgo: Add Milk-V Duo 256M board support (2026-08-04 
18:04:32 +0800)

----------------------------------------------------------------
RISC-V Devicetrees for v7.3

Sophgo:

The changes of this PR are all for CV18xx serials.
There are three major changes. The first is to allow
DMA multiplexer setting channel number for DMA controller;
the second is to add initial RISC-V support for "Duo S"
board, which uses SG2000, a dual-arch SoC (RISC-V and
ARM64); the third is to add support for "Duo 256M"
board, another dev-board based on SG2002 SoC.

Signed-off-by: Chen Wang <chen.wang@linux.dev>

----------------------------------------------------------------
Chen-Yu Yeh (3):
       dt-bindings: soc: sophgo: add Milk-V Duo 256M board
       riscv: dts: sophgo: cv180x: Add PWR_GPIO controller
       riscv: dts: sophgo: Add Milk-V Duo 256M board support

Inochi Amaoto (1):
       riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set 
channel number for DMA controller

Joshua Milas (2):
       riscv64: dts: sophgo: add SG2000 dtsi
       riscv64: dts: sophgo: add initial Milk-V Duo S board support

  .../devicetree/bindings/soc/sophgo/sophgo.yaml     |   4 +
  arch/riscv/boot/dts/sophgo/Makefile                |   2 +
  arch/riscv/boot/dts/sophgo/cv180x.dtsi             |  20 +-
  arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts  | 244 
+++++++++++++++++++++
  arch/riscv/boot/dts/sophgo/sg2000.dtsi             |  53 +++++
  .../riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts | 121 ++++++++++
  6 files changed, 443 insertions(+), 1 deletion(-)
  create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
  create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi
  create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts


