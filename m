Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5521F30C3
	for <sophgo@lists.linux.dev>; Fri, 14 Mar 2025 23:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741995746; cv=none; b=JovtNswj3NL4YC5WOqdUEXz85ReM+OiONORl7YcJ+0n7AOp73DLgoV65WOqUGkwZ5oX/7v+jrE0B3uWNx43O3Y1DBYr+ej8qcCkE/tbU6sRgA6ZNqKRthNhvmBLgQLPvBjcli3Sp5m6lZp+spy7OXcFtkzHf9/HT+CN5aryiRGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741995746; c=relaxed/simple;
	bh=P1WjXnn2+IS+sm+04E3PeSfXgSx8kxihr/R+29fC4IQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kgU6ybL8AhD70EPVe8e3q5BdVez9gmsu+trIFW+bTFiRm7gOBPChmkw0G+YStHXZ6eX1TWXzCErygH+aItAb12GsgxP9zwFe6XgCO6Bb5CcwOFK6oKutuJYmWAYN401/gKABRzACX4lotF7OpfRSdPWMj2PV5m+Ixo4VjwOPfaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tZ1kT4tQ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tZ1kT4tQ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-549b159c84cso2676669e87.3
        for <sophgo@lists.linux.dev>; Fri, 14 Mar 2025 16:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741995743; x=1742600543; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1WjXnn2+IS+sm+04E3PeSfXgSx8kxihr/R+29fC4IQ=;
        b=tZ1kT4tQqdW7eb5/hNbw9j7MfM60lmC92qZw3l1nenPdA6UujzM6iPtksw570FnZkP
         77pKjOlb2kv7OJ9s0Ex85+IJG9ENqvyJNOZ+fvkNstIo/gbCYLdWTv+QDR/xjZeNqZyo
         dtjf91R0LGf5FK7T6CT6eLdHG08VepIwRaTATk+PNDVQ2dgfRIwcPda6s3WBMB4116go
         pjzRPzsd0QU1LJ2jMcr+hLPtYrJmZmCAb1RlrIpLz/I53Yr0PkmThBuhjDwqrl7167bP
         462M/n7J45b3ohG8MH/SvbayP/v9j6xOG61oj5rUace4DRms5d9TNMh+sqEt+ZIr5qXp
         tWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741995743; x=1742600543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1WjXnn2+IS+sm+04E3PeSfXgSx8kxihr/R+29fC4IQ=;
        b=ji4x5NzJfKdRDHvJ2gtsAIRMDbWKeKtP5scM1T7uMvfJSBhfg9szMSYMahCKYZY7RF
         R0kyS6YMwEOcJ1bes5ouLwZk5+ZkaLj2Xzb7Y6JhRTHld/K37dzPGdBbF+jLYBXk13ym
         xz/ZdY0DJ7WceT4sZQCjyNyplBaFaGMYnzDf/BypHQk0E+SFNgam48wPOde10oluGPOy
         kzlrnxaO1hJAdejySWcZFiTAqTZxKEXs7rPF9vw1TDoBvLYuNaDeq1C8ZL2semExm6iC
         WJ3SOhpgyv7ftYzjsXgC/lUSZA5OtfDzAF3jWrlFuthUzjvn+ipbfLvF22tJ0zBpEifs
         A1cg==
X-Forwarded-Encrypted: i=1; AJvYcCVwUJ5cV2ei8las6J8UFPEZ6+VVthnu/YajLBjbLBKBpt4n6yi7Btq6JmJVRDi2qPAqlKdS1EM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4Ib1vqojHboW3+CqDeCgLEH/nS0BFNjHsFV1hZmwmvfE6ozRU
	6QemfLskU01uJFSBbGJEWtjqwdsogH7nv0EBSKy74rovghuElm7052zAftd3tU+iIvvXgQZud+T
	XNxOU7bTKQywdRmHPd1XU6/umvXXp/hwiUEIqX2vXOPrK+BQH
X-Gm-Gg: ASbGncthKCkToz28pVaydRkEGNRFwqDXCFBCuocsEnP9B5MdiiLsDWF+wYdGg6hQaj6
	zaTLnIvjQFLvLJ6Xsbs/E8xkGlBPBH8zWKgf7rE0jvnccz9aGDpfiN8RvxM37meY0EgrQ/6CiLa
	bV0hS9AFBvqXTbS9P4+RwN3Vg=
X-Google-Smtp-Source: AGHT+IH2XrsL8yYl1YnEw5KjXw8pQrBhLhYCrdne0HwB7XZwvtkUckarOcWg0mzevQ8o+qQ4EgbgVcAmMqOmghDeBpo=
X-Received: by 2002:a05:6512:39c3:b0:545:d72:95e5 with SMTP id
 2adb3069b0e04-549c38f58e0mr1469764e87.7.1741995742834; Fri, 14 Mar 2025
 16:42:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <PN0PR01MB1039398834809EEFB83AD25F5FED12@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
 <f65bba9b-726e-469a-8657-693bb640d75b@app.fastmail.com> <CACRpkdb+U7CBMByZeYmNedv8jEhNXn_w3psJSfRi62diOBhGCg@mail.gmail.com>
 <t5p5mssjmpbkwc3myfjnolzt23vo63px7zehsvwfp62mdrz7oi@qcrt3672ghxz>
In-Reply-To: <t5p5mssjmpbkwc3myfjnolzt23vo63px7zehsvwfp62mdrz7oi@qcrt3672ghxz>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 15 Mar 2025 00:42:12 +0100
X-Gm-Features: AQ5f1Jpu-cIvAEmPOEuCazdHtSeZTHJaPnNt4nIJ_esAuZFz_4ZvByvCeSjIFs4
Message-ID: <CACRpkdarxLiyfZJisyW3F_ipiOgOP189iqUkeGtuKKttHp8F1w@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.15
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Chen Wang <unicorn_wang@outlook.com>, soc@kernel.org, 
	Conor Dooley <conor@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>, Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 15, 2025 at 12:20=E2=80=AFAM Inochi Amaoto <inochiama@gmail.com=
> wrote:

> I guess this means we should checkout the binding patch in Linus's tree
> and merge it without other driver patch? Or just take the binding patch
> from the patch serie and let the git ignore the same thing?

Either way works, it will not have the same hash so it will appear twice
in the history but it will be textually identical and git will sort it out.

Yours,
Linus Walleij
