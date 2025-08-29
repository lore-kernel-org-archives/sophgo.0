Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9EB1F0E58
	for <sophgo@lists.linux.dev>; Fri, 29 Aug 2025 00:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756427927; cv=none; b=uH6tUxnrS5Y4Pvko+X5IFeiuRfzWLNLPmX3JkJyznh/J9yIcQmN6ljfXx+Ih/A1xp8Zgbwe+ZXuBt4BYKhpx8/oxqF1H1tFMGmXg1z3J3cMVhXMXtJfxjnqDSpDgF/xpBllOjr+yuZPvUav9XDyTabVRm/5XmNSiiD94coOhHFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756427927; c=relaxed/simple;
	bh=qOHN+W3Wz6uTZsr/RwMmfVYf0YXCACp4YcP7f8Cqg6U=;
	h=From:Subject:Date:Message-Id:MIME-Version:To:Cc:Content-Type; b=XOEblcQtclLBycHwLq/CR55kRkJp2ZKtU0GefjS0T+7pCiPh8VzIkArdPK3nIMaSAGLb9WNb65BbMTqQMm0YnaQDXozg7xjK6KZ8zxuZw/xi3mLBHgi+2pvqqhQK+aBVEY3r+4Iw//uh3NDhWPCdC97B2qLK0q4KRwcdoeMDkec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KsV4iWh8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KsV4iWh8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756427924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8rqunLN033sFAkyGdyaLYf8O7m070HCgXqjcGrGgaTc=;
	b=KsV4iWh8SqElx7Mtqhjfz/lKeGHVShl0mDGBKEirt9L7PRip1P07T+feV/xREnH0MKC2eD
	GPGf/4eFTmTumD2vhla6u2nlm3Z5Vr08cGcEru1NDF3dUvoTFPaR5Jbc2gEwZ7jluMYrPm
	4xhYFcCt2FNeCZKNU8H1PWrz32J1ZAQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-wfrtqytYNiuTEnD5yX1OhQ-1; Thu, 28 Aug 2025 20:38:37 -0400
X-MC-Unique: wfrtqytYNiuTEnD5yX1OhQ-1
X-Mimecast-MFC-AGG-ID: wfrtqytYNiuTEnD5yX1OhQ_1756427917
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b10946ab41so43085851cf.0
        for <sophgo@lists.linux.dev>; Thu, 28 Aug 2025 17:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756427917; x=1757032717;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8rqunLN033sFAkyGdyaLYf8O7m070HCgXqjcGrGgaTc=;
        b=KWgstSgxfMIE/EtFAPunJSa36mVPDXBHguGFgdcqvFvDCiH1ZF2JNvirjB9gjf4G1f
         18SNAxNebx8JWtap+yzbeduDSCJZEywGO2njL09jWnjSE38ZsCSFfU0gBpGExj79fXW6
         37OXAzUpTCSE6i9pU4SSIXPszxYc8qHGFyw0hg3RGLdk3BgzBfRACv9dDNHNeQw3jMR2
         srF8E/aX430pP/jZ4FP9KM6BCvJJZXFGnl/uun99n8J+QEXkTkdO9m/BZ3QbdJ8me5bL
         oPN6rLYneEKCayiAxV78HESFiYfgFxdpU3ndvu2G5ULBWfM9czS9QF4S2ik3cH2/Q+Ol
         B1CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc4s6rqdS3EN+GtMisEp5K03uhXTzpQERyvRzkyCVcU6F0UCbGAJhVwj4i9kAcgOOvhgf+Nac=@lists.linux.dev
X-Gm-Message-State: AOJu0YysBeT8TyQAY5u2rAQp0swtl4YgQP1Avh//KuKFN0kokYdXFsBv
	lug57nofCc5Nyje302zhTFsHaoxaTmsql3gVuNxwgRgJqbcXCiqF/wxcvKzDnh92w6m3R087hy6
	HcF3ZlnrxvKcfET0v/oftMwT7oYruIGr5pDXJuEkdxFmurkHQqT+ZwaUoSA==
X-Gm-Gg: ASbGncvWzT8GEmU4TXhGZx3gV3U50lpdBvc4e0NyVUFn3qRLcimDj20VyAvWJFAlK5k
	CIZkyEs2aXMTmjTrAT1MTvtZrTER5C+e1pEszxjNrzo2DJSIMvHG0dzEmiChPWOQLKxQ9Sdv4Ha
	egfwEhqR4hpomwFSqAQPW/YcjVJKAW693/m2MToaqzmdqMPSTTDV0AVPnGJD3ynjsRzHWuOSIoD
	k4gFY4qLRRRwQ9v7TBBKWnpKynk9IvXniTpN+PXvdBoIEe0J4vs5VP8GIgp1UOxfU7H7x7lmnit
	yZg53+WOUhkB8JliLixvTPW12xkmTzPYfyNI0ruzuQdSDHKXuQ1SuGohwIfGfEL8XN1EnpjB/7q
	v4LfBQkPqzMeF/CWsxk0q5OC8TUcvGJvpyQ==
X-Received: by 2002:ac8:5acb:0:b0:4b3:7ec:d22d with SMTP id d75a77b69052e-4b307ecd715mr29164901cf.20.1756427917039;
        Thu, 28 Aug 2025 17:38:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrNg2tdKhgAQRayLc8LgRw9eIVhmfPzttivKDw9wQ2+vibEJMjJFoedzMgEqufDrqQJ1tp1A==
X-Received: by 2002:ac8:5acb:0:b0:4b3:7ec:d22d with SMTP id d75a77b69052e-4b307ecd715mr29164561cf.20.1756427916486;
        Thu, 28 Aug 2025 17:38:36 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e6264141asm5588696d6.65.2025.08.28.17.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 17:38:35 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/8] clk: convert drivers from deprecated round_rate() to
 determine_rate()
Date: Thu, 28 Aug 2025 20:38:19 -0400
Message-Id: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHv2sGgC/x3MQQqAIBBA0avErBtIQdCuEi1KpxoKi7EkiO6et
 HyL/x9IJEwJ2uoBocyJ91ig6gr8MsSZkEMx6EabxmqLfltR9isGlOEkzBq9GpVVk3E2OCjdITT
 x/T+7/n0/tcMa8mMAAAA=
X-Change-ID: 20250828-clk-round-rate-v2-c1b181f598d9
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756427914; l=2337;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=qOHN+W3Wz6uTZsr/RwMmfVYf0YXCACp4YcP7f8Cqg6U=;
 b=2DUui3a8WkDmdWMGxKa0tpZlU3l9oMHhpwiGjtyJgflCFJnuf9oCUJ5nnO47Aeh60KidBjjhF
 owMBgQLSuwVBuDusC8N4CQta4YOJg/XwS432e14Efcrlr58u+ubkwbg
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rKXsRuyQBclWEyJRCLCwsSH_v6X7-BgCvs9F8u9IYH8_1756427917
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Here's a minor v2 to my larger 114 patch series at
https://lore.kernel.org/linux-clk/20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com/
that only includes 8 patches where a v2 was needed. To reduce the noise
in everyone's mailboxes I'm not including the other 106 patches that are
still valid. I will supply a 'b4 am --cherry-pick xxx' command on the
other cover letter to exclude the patches in this series.

This series has no dependencies and can be applied in any order.

Changes since v1:
- clk/rp1: Updated to avoid merge conflicts based on what's already in
  linux-next.
- clk/sophgo/sg2042-clkgen: Removed &*
- clk/sophgo/sg2042-pll: Updated comment from round to determine rate.
- Removed unnecessary space after cast on these drivers:
  - drivers/clk/nxp/clk-lpc32xx.c
  - drivers/clk/x86/clk-cgu.c
  - drivers/clk/zynqmp/divider.c
  - drivers/clk/qcom/clk-alpha-pll.c
  - drivers/clk/rockchip/clk-half-divider.c

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (8):
      clk: nxp: lpc32xx: convert from round_rate() to determine_rate()
      clk: qcom: alpha-pll: convert from round_rate() to determine_rate()
      clk: rockchip: half-divider: convert from round_rate() to determine_rate()
      clk: rp1: convert from round_rate() to determine_rate()
      clk: sophgo: sg2042-clkgen: convert from round_rate() to determine_rate()
      clk: sophgo: sg2042-pll: remove round_rate() in favor of determine_rate()
      clk: x86: cgu: convert from round_rate() to determine_rate()
      clk: zynqmp: divider: convert from round_rate() to determine_rate()

 drivers/clk/clk-rp1.c                   |  58 ++++++++------
 drivers/clk/nxp/clk-lpc32xx.c           |  59 ++++++++------
 drivers/clk/qcom/clk-alpha-pll.c        | 136 ++++++++++++++++++--------------
 drivers/clk/rockchip/clk-half-divider.c |  12 +--
 drivers/clk/sophgo/clk-sg2042-clkgen.c  |  17 ++--
 drivers/clk/sophgo/clk-sg2042-pll.c     |  26 +++---
 drivers/clk/x86/clk-cgu.c               |  35 ++++----
 drivers/clk/zynqmp/divider.c            |  23 +++---
 8 files changed, 201 insertions(+), 165 deletions(-)
---
base-commit: 8cd53fb40a304576fa86ba985f3045d5c55b0ae3
change-id: 20250828-clk-round-rate-v2-c1b181f598d9

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

