Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D573C4547
	for <sophgo@lists.linux.dev>; Tue,  2 Jun 2026 08:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388809; cv=none; b=IeEAfqyzQPFVK/jO7lHy55jAG4W6P7NtDbzbwiWfepRyamvL26gLojZaIQnc0B2HfERRUuRhx1vaZGdyAq9g58doj7ahy/yNkl0PumY9QhOZQap9oFvL65WLfkWz4leoraO+o4GubAQcbQeaxEsaEts7b0Cqwrqw/hjTcEptNgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388809; c=relaxed/simple;
	bh=GFo7eyr+k93doRn4+DluxLJbNFu/w/tMJvyS/O89sYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nu24hanCIJTOh86JdC/QKikaOYlAiBqgCX+WI+e4XY92lP2H752w19b1xvXQ19TXmzJpiaH/g0OmAOrafRwNZaCo4xJGxnjmo/g7VDrTJhP6ysYYUNCLVB7kJZoGt3u8XycHuPG6ITBDOsVQcR5+Xh74WkbRsTNFqXFqbvlbPv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0q69ZQv; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0q69ZQv"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84234c83142so947977b3a.1
        for <sophgo@lists.linux.dev>; Tue, 02 Jun 2026 01:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780388807; x=1780993607; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOUthwrtbXM+y6Tz2Zof/YPxQsVutrNjHKZLo6oqW54=;
        b=R0q69ZQv0GXhQkOu8Rkzt7+WE5iwbbZxqr9cntMJnU79nzhj8KuqKEUlwjRKaBtgvQ
         zERiBVxRmFPctWztnUpyOazcku71eenjAWNWQNvVsS9GTmGy5pj1Q5bxxIeMjNrxU5nT
         e0cCAqBm0Ncc9zolK+t/wrD2zaaolSzUXV7TT+5x086OiTr14j+QxCtuzARpSnCQ/EcG
         PajQoMpwBKdcYs+bu4qcvEDqe47Sdv+bP4JNmsePEL91xKv7hbY013ivlUs+aLNRFlLu
         TCanWM/Qf8OGh9Q0C7lEhKdzDE3tn64Hv32eRBJ2WGUSUkKvMbqfCwm8enaCRsHxCMoR
         GDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780388807; x=1780993607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gOUthwrtbXM+y6Tz2Zof/YPxQsVutrNjHKZLo6oqW54=;
        b=olNlP1RRgDcwhnNLjQyaG8Gt8iSY5ZGbFKZftDdYe++RBk6c0zd34TOkkBspZgJGvm
         wty2nMh9oYvH70E8iTKF/S/00AR052unLVRvYS9ymav+kM0tvH3MZK7S90ggbr5P/OB+
         MqY1CIIRv6bv/unAseqHk0i5aruaeKJHWYLFzWzwdpUQo/SJSh2pTdh4lAKVfyuBe8mX
         dUX/RTiTpnh8NfTSinUDL7jjp52PJq+pXDL7Y87CNoplUzVeYVP1/Lwkke7R5kotizR/
         rGqC76Ex9eMLLKiQiWiOVBTaHVM5y7JSQUXvsG14pR9BDYsLTxXzfPPr0dJcVVGNF6Me
         8iSw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZcfZ9VPJTNoV+5RNmMW5yVzQBxhvRKoZ1H5ZAZ1kBYC2+mmc+PeWyktMUgEGUITcxkePI8c8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRDs6vmEyxYO0DmaPbeeYBEucJohWUhAuCuHPNBDZyvsy8SMnB
	D3o4kpIY2JuaFNi/Nxa5VCGfg+laFdJJrpH6KzJXUOO5o9XJyiADVteA
X-Gm-Gg: Acq92OFS1P1XGg+ui7GnAuAMQn31gqtNxbN8kB9uOgmsyH9w46ukVqQmA2hB3prZyaA
	f0lCJsAitf2ppXU/T7dV+/ncLfqwSsAQSAmlm+9nc1+v4jpC6wyJEs20SLVsVHlcjviDb62VGlQ
	56JaIfIz1iDV59AJLYEF0YsISCu6FcJPklA7HLhsPItvvQxs3PqtfqVUizk7KtsiLIQKScsXMak
	dOFHZbmUOyYz4XNeMoncgk7IiCqTgS0HybwsFjnvk/ERDCeliiklLuoKl02dukQQKIsHKv/zinD
	kBgKjx2ffmmPH2edqsCKXWgRGSzAnEEcXUpO/LMG+qznLvoNuS4VI9LZICFoBESvBRdx3oMyQek
	VLEXghbTNQ8oguYBWAp6lPbG9flVAR3vPzFIcm/xWCXp0JxwBwX1q+UwFYZLvFalK1FiP/t9Qaa
	eYxLSmC4ggsNHsKMZSoY2nBVjckq1Ntqv+uw==
X-Received: by 2002:a05:6a00:9457:b0:842:2f28:4e53 with SMTP id d2e1a72fcca58-8422f28a4ffmr11145495b3a.47.1780388807111;
        Tue, 02 Jun 2026 01:26:47 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842498819e3sm7025142b3a.34.2026.06.02.01.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:26:46 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Joshua Milas <josh.milas@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: Re: (subset) [PATCH v5 RESEND 0/5] Add initial Milk-V Duo S board support
Date: Tue,  2 Jun 2026 16:26:23 +0800
Message-ID: <178038877400.2114604.9271390665852626517.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530173347.33533-1-josh.milas@gmail.com>
References: <20260530173347.33533-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 30 May 2026 13:33:42 -0400, Joshua Milas wrote:
> This adds an initial device tree for the Milk-V Duo S board
> with support for reading from the SD card and network over
> Ethernet. This is continued work from Michael Opdenacker's
> v6 series [1] on the ARM64 and RISCV side. It has been tested
> with ARM64 and RISCV64 to boot from an SD card, have networking,
> and read I2C slave devices over i2c4.
> 
> [...]

Applied to for-next, thanks!

[1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
      https://github.com/sophgo/linux/commit/efe66eed43ef507a5b3784d988842d2e621806e1
[3/5] dt-bindings: soc: sophgo: add sg2000 plic and clint documentation
      https://github.com/sophgo/linux/commit/972e8823d93866bc39cf6270bd5ec26d055b9d6f

Thanks,
Inochi

