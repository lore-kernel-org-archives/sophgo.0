Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794768821;
	b=YRFmU38MDBBW2zBB/nqMryHgcwyHrHsWYWEq2bfzTg/5T7QMcz1PpPjOX3GHsiEr4EDu
	 DGAyr9qJ8/4nNRDZtyMLB/dOcIjzOnVb21tulwa5qU6N60akzHNXA6leWrmEy+wgd/5Vb
	 /Q+6OB/brvWy9GPpKAHK3EL1kzguYMS84g6zsAnQtcDdol83E/potllRWrpFWqgbRn2Ae
	 PqzMn34OcYKmFGx/oqZqA0LGviTv8aPuX8B2tOjE22oDS/3eS9JTaEAxvcyVSAO18mgcM
	 ZaCat6Bk9fUHs0GwlthBEmmEsZx4dfylvDOSCXQGshQ/AGlYR1s+ECuf7T9g/W6MCJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794768821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kgBPwDDX0CwJQQOHPTuz21QVSBDvEn3NadhaVZDEiYM=;
	b=EdsdqUeoLugKQwe+C8OSqlHNCPKVbYzQ0BivontHg5Q1RwWeHKUiE1aUoR5ZmyGeKzuc
	 BXF7uiBrterHMpa0QmVxk8r6G+AsHeY740O2E5YiCijUNGToDiZT0MGN3m5VPltwFBDr5
	 +iMx7y95mrTHAXigfbSPvU8ytAPfnc6IBtDNZ+dpF8KND3owKceuSLK24iPoG/45QlsFv
	 7uDI8EyrQBWGUFqJ3GGyJ+ssUEO+xqs6c3+ADPIWkvhP7gKzog+5g5ZwIbxztu3f7wD6X
	 56JvsqfCZR67MF2DYBIjOcJaJLZRjpxMrjLRr7emOGb67+Wd2RE9wWol0etklgyj1BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yuzi.co;
	spf=pass smtp.mailfrom=yuzifovich.name;
	dkim=pass header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b="Gh/siUS7";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33269606A31D
	for <sophgo@lists.linux.dev>; Sun, 15 Nov 2026 18:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33269606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yuzi.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yuzifovich.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=Gh/siUS7
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so15815755e9.2
        for <sophgo@lists.linux.dev>; Sun, 15 Nov 2026 10:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yuzi.co; s=google; t=1794768819; x=1795373619; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kgBPwDDX0CwJQQOHPTuz21QVSBDvEn3NadhaVZDEiYM=;
        b=Gh/siUS7R6ftAthY+9L1j9sBT2NgJxFEnl0BwLcF0V98UHB8DCYCYi561+l8JjEdhx
         R6dKLvPbJCPG2jjDG3m1/bUHgLx6X6Nx2qLFtbYuZqft15h/O0F0K3ukVK3/convgBfh
         BviqWX9vhmXwazMLTsweWbL8gtGM8GGHVnUfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794768819; x=1795373619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgBPwDDX0CwJQQOHPTuz21QVSBDvEn3NadhaVZDEiYM=;
        b=f3CRXp9v6ESRN+9lHdTtqMlXmkNUveNZErVbs3cKkugbGactYf+JMl6LwvSK8GDWjI
         yyqHKhfd0c59IGDlvOr1lca1+cYWUJZyUFjkncYa7n4NhVxnbsF82laySGmTEyp9J8bo
         ku3cmZbh97eNV10hVE+xfu/obeXzahn9/sHE9WWUPXvvy7qW8B7kz1hfP0NtsYwYLMNy
         FFeQAcqivEn6samh4mGaLM8KiIpWUY+IvRh2w0s/UfYM83Lf81jp6ngzodubvqyT/cEG
         SQGL5Mz2picw1JP4uKdqgotSBMc1XpZzkx8KMBCwrUC0UP4ubYeOR8hVW+7Ad+xPat0u
         2zdg==
X-Forwarded-Encrypted: i=1; AL+hErFdIzvdS29q3YigUNljrSdplBzqQvmvOnJ9xBqmV3BAvStIzAGkx1IeJoNgycIGO26BLjpwuO8=@lists.linux.dev
X-Gm-Message-State: APuU4Z8G03yrcVjd86szsg6txVCNCs/RnJRIW/2PA6AJjmVNzEuLgCaE
	iAO5dxIEnh5Y4wj7G72oCkGbHuyplYPNDzmYgsGiyk8uh93c/mCdW4UY49CM7x40lvI=
X-Gm-Gg: AYBFou2UGrpvTbOT858VncjS/4S8yldmPI9dDwGdwMjNdE4Bh8XXMW2JKJyiP8ENaST
	clDwqpWKxdKr0a1GY4H5pZmAHMA3KqJUxLxuLgh8h0c5f6MDv8LQDP7FVrqZ/yw+eF5HvPhwCZD
	Q4uDpTt0ztQb4F4V9/Nf1Mwsqd650vNdCWhoGGotIC+vz+U1PuEQRgTVJ6SGlrDdxD9hXTMui1E
	JfsMPYCiJr2M1R9NL4IH/8ksPrpdn2pZUkB10htdxK2iJ6MXvZ2BOJLAcI6ZZirvV1AREhL9q50
	J4Q5VExGt666QXr3tEA0R22XB1zaMRnltlye5t9npnlv5I3hp3uvYNxbnN6x5gkmaEH/Fnb5R9c
	ArV5p1wk3KBaN5HdEwcCQ8jNbMThNeWTfKgrveTPtNXDAFZHbMREOyeK0A11Nj14dcdH7FM5oUB
	gv3CO3aIT9Ar2tN6QLUBGbfL0jVG/bZxLATzt0lWD1ONd2p71hqKtw005KK/BZ/o9eGhOXMUeHf
	G0vt7EIBNbmNe5iC6qSXkrX7tHjKoildbZjPoJDAwvWDYTWC1Bg9onXp6KsgXYDTRaEQ5L34aEA
	IQBymhNMeVr3cCuiVCK+D/RkAF/KY4e0x7vYlRTqEWZ90ZkWoLRCxc+mMbcgVm1NJlmw4vQXKSD
	IYZbJEoJkjiN0e159Q1WtvZOzjYf59qdG9mIln7LhfdNIixtyc9+u8YeyFkba0TmcBMF8BWGkxI
	gNmw+4rLq3G6TmOA==
X-Received: by 2002:a05:600c:3ba1:b0:4bb:6847:792d with SMTP id 5b1f17b1804b1-4bb68477c2dmr82470275e9.20.1794768819503;
        Sun, 15 Nov 2026 10:53:39 -0800 (PST)
Received: from terra.lan ([78.83.170.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm508419145e9.1.2026.11.15.10.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:53:38 -0800 (PST)
From: Vadim Yuzifovich <vadim@yuzi.co>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] usb: dwc2: gadget: descriptor DMA fixes for BNA, found on Sophgo SG2002
Date: Sun, 15 Nov 2026 20:53:32 +0200
Message-ID: <20261115185335.782678-1-vadim@yuzi.co>
X-Mailer: git-send-email 2.56.0
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

These are the three patches offered in [1]. Chen-Yu asked for them as a
series and offered to test on a Milk-V Duo 256M.

We run a Sophgo SG2002 (T-Head C906, DWC_otg 4.20a) as a peripheral with
g_dma and g_dma_desc both on, as a composite gadget: mass storage, HID,
ACM and UAC1. Descriptor DMA works there, but only with these changes.

Patch 1: an isochronous OUT endpoint that takes a BNA is never restarted,
and the BNA interrupt then repeats until the host resets the port.

Patch 2: a bulk or interrupt endpoint that takes a BNA is only logged at
debug level. It stays disabled with its request current, and the
function waits until the host times out.

Patch 3: why bulk endpoints took BNAs at all on this SoC. The core
fetches the descriptor before the CPU's stores to it have reached DRAM,
although writel() orders them before the enable. Reading the last
descriptor back between two full barriers closes the window. The
measurements are in the patch.

Patches 1 and 2 look generic to dwc2 descriptor DMA. Patch 3 is the one
I am least sure where to put. The effect was seen on the C906 only, and
the read-back costs one uncached load per transfer on every platform. If
it should sit behind a quirk or a core parameter, or belongs in the
RISC-V T-Head errata code instead of dwc2, I will redo it that way.

Known limit of patch 2: it starts the current request again from its
beginning, which is right when nothing was transferred. That holds for a
chain of one descriptor, the only case we hit. A BNA in the middle of a
scatter-gather chain was not exercised.

Testing. The series as posted here, applied to 7.3, ran on the SG2002
under the load described in patch 3: 1.47 million TEST UNIT READY in
8 minutes (about 3060 a second) with a 1080p60 H.264 encode running, no
BNA and no port reset. The viewer's network link dropped several times,
so the encode ran for about three quarters of that time. An earlier
form of the patches, which our tree carries, saw no BNA in 6.2 million
transfer starts and none in a 60 minute run at 1080p60, where there were
about 6200 a minute before. In that form patch 2 also waited for the
core's write-back of the descriptor at XferCompl and changed the AHBErr
message; both are dropped here, the wait because it never triggered.
On 7.4-rc1 the series is build tested only (x86_64, W=1 clean for
gadget.c) and passes checkpatch --strict.

To try it on a CV18XX/SG200X board, gadget DMA has to be allowed, since
dwc2_set_cv1800_params() turns it off:

  --- a/drivers/usb/dwc2/params.c
  +++ b/drivers/usb/dwc2/params.c
  @@ static void dwc2_set_cv1800_params(struct dwc2_hsotg *hsotg)
   	p->host_dma = false;
  -	p->g_dma = false;
   	p->speed = DWC2_SPEED_PARAM_HIGH;

and "usb: dwc2: Disable gadget descriptor DMA for Sophgo CV18XX/SG200X"
must not be applied. That change is not part of this series. Whether
DMA should become the default on these SoCs is a separate question, and
host DMA was not tested.

An AI coding assistant (Claude) was used in the debugging sessions and
in drafting the code and the changelogs. The measurements were made on
real hardware, and I have reviewed the patches.

[1] https://lore.kernel.org/r/CAH_=YdDCDyFBn2k18w8Ck5jrmHHZme7TuAA71hSgcAa9ZPb38Q@mail.gmail.com

Vadim Yuzifovich (3):
  usb: dwc2: gadget: restart descriptor DMA isochronous OUT endpoints
    after BNA
  usb: dwc2: gadget: restart descriptor DMA bulk and interrupt endpoints
    after BNA
  usb: dwc2: gadget: make descriptors visible before the endpoint is
    enabled

 drivers/usb/dwc2/gadget.c | 112 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

