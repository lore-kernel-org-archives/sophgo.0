Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5512BB17
	for <sophgo@lists.linux.dev>; Wed,  5 Aug 2026 00:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785890757; cv=none; b=XLMu5L4F8zdOAbawFALUujgGanUtOxrZr9XW27JBZeTeowXwZRK7WPqkvEA58RPAFeGteIs+AF1xaSPF9A3z5XxkM6U7etNBGXDvqBbdE1IMwZIBvcmi8hdMkMzGfpmG280D4AhgVV8xwb/I3eM5HAYvioScqNRabTQbBf+IMjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785890757; c=relaxed/simple;
	bh=6B+rvSDc/PnF3Xd4qn2GBLURqoGngogDuxv3umlplQU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=fxuFymFIvjDPJo+WvwWrnZ33NiBs6M/RzMwOoWkSlfK75AciYBlE+/BIfR2Y5DXTdmDVFyyS6p5lkFTCTpI7V4wCdDrSNYYasRPl2kPqX6i5e3aNtsUUMVMeJO65pZ4bo3uyJH1uQfS4eiKW+nBoTFVCLQShabRrfQ74s6AlXg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oQYP44F6; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oQYP44F6"
Message-ID: <c68193e7-4917-4941-a461-b70ff9521dc5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785890753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wIHfopREpj63E+t8aIw2YnOoOYw/Ruoq0AuZz9xlk9M=;
	b=oQYP44F6FoHStEmYnwI5ikgmyxlg4rnWi9TtP56KrrYbr7LNNwCSQzIDFqGhN5TGMP6jq9
	Oy4BOiDNXe/eCray/6hLSwYBRhsfwtL7zfVRNiVgXF443Ns58WfRBOAl3VoZayOhGWSA0f
	54fDqvQJ9UbZNzXKaexRxrSVfJ3K2Ko=
Date: Wed, 5 Aug 2026 08:45:20 +0800
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 Chen Wang <unicorn_wang@outlook.com>, Chen Wang <chen.wang@linux.dev>,
 Joshua Milas <josh.milas@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chen Wang <chen.wang@linux.dev>
Subject: [GIT PULL] ARM Sophgo Devicetrees for v7.3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hey Arnd,

Please pull this dt changes for ARM/Sophgo.

Thanks,

Chen

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/arm-sophgo-dt-for-v7.3

for you to fetch changes up to d5e1ea5b05fe62c296701251c628ced6c68a6a80:

   arm64: dts: sophgo: add initial Milk-V Duo S board support 
(2026-08-04 18:05:28 +0800)

----------------------------------------------------------------
ARM Devicetrees for v7.3

Sophgo:

Add initial support for "Duo S" Board.
This board uses SG2000(old codename CV181xH),
which is dual-arch, RISC-V and ARM64. This
patch adds the support for ARM64.

Signed-off-by: Chen Wang <chen.wang@linux.dev>

----------------------------------------------------------------
Joshua Milas (1):
       arm64: dts: sophgo: add initial Milk-V Duo S board support

  arch/arm64/boot/dts/sophgo/Makefile               |   1 +
  arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts | 244 
++++++++++++++++++++++
  2 files changed, 245 insertions(+)
  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts


