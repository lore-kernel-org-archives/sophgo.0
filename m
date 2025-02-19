Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B596134BD
	for <sophgo@lists.linux.dev>; Wed, 19 Feb 2025 02:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739930558; cv=none; b=RgHbacXvTb21zHrYoFAwvmx74d0iOnnmKC0e4xd8unaR7F2CyYPmze7zexaYcmTqoWGGRFzchXxPX3RZ06Ja/t+WH0QlexOqtfGBejtkJ7kyOYRw6XrJfoO2F/Bmdo4WjuIAuMjNHILc/7eoFC3M6hL7Lp8KJRuXzAO+iAXMlYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739930558; c=relaxed/simple;
	bh=tSVYR1llQvTI5Kv99pwKgISlYZrlOljaKobqaa3fY8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UA9R7kUdDeoGUiHLTlrRcB5CGnFKPZA7qnHhr5jQQ5UEG4fT7MpDssn3Np2tseLKsKxQXwX46kPrTbKzak1E2hMKkQ7Z2YUiC2BMFLlnjRqtAta4s0U1rkycn247rZPGmpBM1t1VnrWe/BjjfoGAohBoBu2EiHRfXGR4nRA9w4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6LUy3Tk; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6LUy3Tk"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e17d3e92d9so53660046d6.1
        for <sophgo@lists.linux.dev>; Tue, 18 Feb 2025 18:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739930555; x=1740535355; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=980SAjG821KkBNdaRx+A15s8OgNFk4ezjXKzzUAttK8=;
        b=B6LUy3TkyGT0ChwRN+U1GsY+JqaQPryXFpxac77QWTzBQ+b2hZrfJZQfdWLySOtvUl
         jrzb0geMCwX6dQDZsLvVrTKrkXeLNuqi7KB+wYJjFqhfTvAfXuJQjT+RrnihcTN/VhbV
         zsK4oVS2V95vG5VVVI9uVu+xW5oQfFMDz8EAEODQNnfU+Lt+Sxb6xW38zL0XCUJJ4QyW
         dsPJgcafrioR3zyT6C6gXRMq+MrTgljJ4XpiWLbhcMoJ5MaAOWqaBjZueupsGuokBp+3
         nRsfplZHRYUS72yulMAhZv5wOk21Myq1nhKxeqDH06Tr9v/l00gZ9lhu0XQDiB2OIWDV
         BMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739930555; x=1740535355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=980SAjG821KkBNdaRx+A15s8OgNFk4ezjXKzzUAttK8=;
        b=RnlP86VDm08wa/QEE8BGlF5hWpqo8I1mQUFu/vqeBRQHt071z2QqJbvrZiLS4dMekJ
         7JoSJgYcufUBThUsjYQgCptyuJ241YMoPz3F43VodfVsUB/b1gQE01Lu1GNkWBBWOKEu
         CuT1xJTZz/SoDQGiiWhg7tTnDIzECuVMJh9ENnl6IlmsqYxmE0NEf9vJY0uk1bv+mxux
         QG53akw8qm9fsiDLYgsXJyEROC053MKL4Or23GBNUQwhmvKaVGLYmKMbFOntvtvGlDkW
         PxgqPBvFJnEx1AE/6FuD2RBiNcSTIGodhsMQwJO6NzlA0C3CE/fzu4LKgzujszN7+hNQ
         SfrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMX1TVYNfDzeELiZFEtHMUVW7TV8dKULfDR2ysYu3+pLaly8MkasO2oaVhd2D6Rb88xtrclI0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz91bR7/Vlk4KHMPVAcMWVAN3QFltw672Ux+z0eByiWsgm3TUH1
	PFX5/fWdyUsnw22eHHtXc9Dw5ysKVQ50CcqHFV1YIbeQi31LOZMS
X-Gm-Gg: ASbGncvh1rD+U7AXkpxcxsxnKuP3xDQB2e2aAf//DeU4SMxDUb9krNgDuUjvck71i5f
	q6xAYP0X4y9pXGsX6Caj3nOTHyDQhXWqe1FXWCjIvrW68v3/3uRiblecaXINCoyArPugy5bNhcN
	YoGY+DvakNe3AOorRExlggVMZ4UfO7jgZok/tcuw7IGSjcLbdxw3re5UttYRWSa1JNQKVzaZLwJ
	rJX4xkknOPtLxQOC7DfIEUy0sqoZEO4YgwXjMS0KReB5dfaRYegfx1FoJvRkLa2pgo=
X-Google-Smtp-Source: AGHT+IFao5uYt/opWCP18gBhrPbDbhzTsVioAhM4PEXmi9PCMUnZww8XRVKOU3gkOFPTX9L4VDhHrw==
X-Received: by 2002:ad4:5f0a:0:b0:6d3:fa03:23f1 with SMTP id 6a1803df08f44-6e66ccc1141mr227209846d6.13.1739930555333;
        Tue, 18 Feb 2025 18:02:35 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e67ac30bafsm32452896d6.111.2025.02.18.18.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 18:02:34 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: aou@eecs.berkeley.edu,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com,
	sophgo@lists.linux.dev,
	Chen Wang <unicornxw@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH 0/2] Add pwm-fan for Milk-V Pioneer
Date: Wed, 19 Feb 2025 10:02:19 +0800
Message-ID: <173993053303.993263.3269292978255036963.b4-ty@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739351437.git.unicorn_wang@outlook.com>
References: <cover.1739351437.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 12 Feb 2025 17:41:44 +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Milk-V Pioneer uses fan as cooling-device, and speed of the fan is
> controlled by the first channel of pwm controller of SG2042.
> 
> This patchset depends on another patchset for the SG2042 pwm controller,
> the driver part is now on pwm/for-next [pwm-for-next] and the dts part is
> now on sophgo/for-next [sophgo-for-next]. If you want to have a test,
> you need to apply the corresponding patchset.
> 
> [...]

Applied to for-next, thanks!

[1/2] riscv: sophgo: dts: add pwm-fan for Milk-V Pioneer
      https://github.com/sophgo/linux/commit/62cdf0a06dd5a650e4ca95b6f3a13daa48cf517a
[2/2] riscv: sophgo: dts: add cooling maps for Milk-V Pioneer
      https://github.com/sophgo/linux/commit/f047a9285f9f3fd5c0d5ae53af350b8b619e470a

Thanks,
Inochi

