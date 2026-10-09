Received: from mta0.migadu.com (out-226.mta0.migadu.com [91.218.175.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B00949B448
	for <sophgo@lists.linux.dev>; Fri,  9 Oct 2026 09:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537855; cv=none; b=BNaoDLZTFkKMjZgtfctpXrr+InqPkPgTetPPP7sptlWxy77FGW3kl9IId0h8czqtJSkKhY5XWTYNLcVTsgL04/HWHIpKvSW7CW7Kar0JSZEaAVPJ/6cQT8jU4gRZKmME9nkzekBRJN7q+IF/mW4LLUzaOuBh1sMjyu5My5wi1XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537855; c=relaxed/simple;
	bh=XgNkPeYW7ROgFKS71jetaL6YjpKcSR2rKTGynR4c8UY=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ORi6CLxKimUtK0QmydapjOxMmp5WI89lA4mK+XXU+7aBi9vM7S2TcrYMaGzzm09+uOtEsKFbblLsQ++kH4zd0zCN6y8+1CZsPWcx+BIYwfn7bybUK7k9JEx7gfcs7B7eyoaQkg7dVZ+LfjmkK0x+wRYRuCOKoUWBHleno2XIbUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tdM94Avr; arc=none smtp.client-ip=91.218.175.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tdM94Avr"
X-Envelope-To: sophgo@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=XgNkPeYW7ROgFKS71jetaL6YjpKcSR2rKTGynR4c8UY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791537846; v=1; x=1792142646;
 b=tdM94AvrRqD838H30yqCwyom9HqrVohl4apyzYL5Uhy5WwDZsg53sasx5YA0yfWs9evq2jfo
 r1bhq8H0MdYAJd06taPHBi8fP+9Gn9rqxStEPEcxlFUgr4wvrp0tI/HdiziAcsh9Ou2pvWNHIE2
 1+LnWHLm5y2n8o9ouygytbek=
X-Envelope-To: sophgo@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id bd9b3ea451def7a3;
	Fri, 09 Oct 2026 09:24:06 +0000
X-Mizu-Trace-ID: bd9b3ea451def7a3
X-Migadu-Flow: FLOW_OUT
Message-ID: <aff6ff25-8969-4a35-9543-9113afb2e003@linux.dev>
Date: Fri, 9 Oct 2026 17:23:58 +0800
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Chen Wang <chen.wang@linux.dev>, Han Gao <gaohan@iscas.ac.cn>,
 Hangfan Li <lihangfan@iscas.ac.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>,
 Andrei Lalaev <andrey.lalaev@gmail.com>
From: Chen Wang <chen.wang@linux.dev>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v7.4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hey Arnd,

Please pull this dt changes for RISC-V/Sophgo.

Thanks,

Chen

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v7.4

for you to fetch changes up to 60e4cafd30908e7d8cdfdb4fa1a74dabed9f47b5:

   riscv: dts: sophgo: sg2002-milkv-duo256m: drop reserved memory node 
(2026-10-08 09:13:17 +0800)

----------------------------------------------------------------
RISC-V Devicetrees for v7.4

Sophgo:

For CV18xx serials:
- Add an overlay to enable MAC and MDIO multiplexer to
   reach the internal PHY so we can use Milk-V Duo 256M
   board with optional ethernet interface.
- Fix the name of the internal PHY node.
- Drop reserved memory node, and leave FSBL to decide
   this at runtime.

For SG2042:
- Limit SPI NOR to 12.5 MHz.

For SG2044:
- Enable both SPI NOR controllers.

Signed-off-by: Chen Wang <chen.wang@linux.dev>

----------------------------------------------------------------
Andrei Lalaev (2):
       riscv: dts: sophgo: cv1800b-milkv-duo: drop reserved memory node
       riscv: dts: sophgo: sg2002-milkv-duo256m: drop reserved memory node

Chen-Yu Yeh (2):
       riscv: dts: sophgo: add Milk-V Duo 256M ethernet support overlay
       riscv: dts: sophgo: cv180x: Fix internal ephy node name

Han Gao (1):
       riscv: dts: sophgo: Limit SG2042 SPI NOR to 12.5 MHz

Hangfan Li (1):
       riscv: dts: sophgo: Enable SPI NOR on SRD3-10

  arch/riscv/boot/dts/sophgo/Makefile                |  3 +++
  arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts   | 11 ----------
  arch/riscv/boot/dts/sophgo/cv180x.dtsi             |  2 +-
  .../boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso  | 17 +++++++++++++++
  .../riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts | 11 ----------
  arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts       |  4 ++--
  arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts       |  2 +-
  .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts |  4 ++--
  .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts      | 24 
++++++++++++++++++++++
  9 files changed, 50 insertions(+), 28 deletions(-)
  create mode 100644 
arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso

