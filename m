Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC9C339388
	for <sophgo@lists.linux.dev>; Sat, 22 Aug 2026 22:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787437654; cv=pass; b=b6cYfI4Ocv9/QMISsb8c/ER2UHwUcrhd6EHGC8TEOb+RfVwICR75emeA4fSQJ0+RJl6J44R6MRmUoHOG9l+qoSp4sRdBtKIliKPhTeM9jjLRd8GcXue7qsDp0FYMB3GDrbAV4Y6c78LtUl1YDUSQyzUae72m0VAIDgilm/QxtCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787437654; c=relaxed/simple;
	bh=JUAn2KimmN/o/eHfXlDSULICtgG62oPP2Hyu94+omBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MtxZ0jrE1C+oS1oFfajzp0+rmNAVt0zHceTssTEF+vviYwUgHrbEEcw87FRzN+zF/1faAt5jdoiaKwXeKDROr5icLT6yBjBv+YL9mrm5/nLaOY9zj8ylc0zE/QWuaeAbdrWHrJmgXDEetqfIYwLihwKWw5kZA97D0soNjEG53w0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwZ4ib7P; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwZ4ib7P"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso3102277a91.1
        for <sophgo@lists.linux.dev>; Sat, 22 Aug 2026 15:27:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787437652; cv=none;
        d=google.com; s=arc-20260327;
        b=F1g1GIua+LdgbD70PJLg/Myk0z13q6AB3KdBaLsojLA2QVhB93p38u1FxcUK4lKksk
         SO5XBy6IKG/4cUo4JFblu+iD4YBcz8veaUMDw7PGtzU9C26rTgVK7/4Wt2vmbNsonrHG
         xXO8Yevgc5DCohe8fkcyb4kATucvY5UKiuvUrP0TOI5u37PrZFYylsMdEG434niEorer
         7eXiF0QslzoYMg+iffGO7DieYbda/3OQpALp2FVZnBFxuJ+H9wBejsnca3+K6OliZpdG
         fP/PmNY9UtMvIFC5io/LPIPHXcD+8vgVh5VWUlhFgIwAJMXDuRjcy/FZ5Hy/twhYwgeL
         MWxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=h2KBP7bJOZESyKVN512DplqH6zyDbmVZ0g4qOVUEItw=;
        fh=nX0aZMPzV1jj4dUykolXUEAYgZPw6EEJe/oSGUVUhx8=;
        b=prrsM5XA+xHEnRzd5aZYBl1GtbSdN4dt8zUmC+7yx4AprxGrCb0kEkcun3wts7t/pS
         jJFJxXuJgqdfgiCZLcxGeo59CFNXGbK2JTIMesv/VrzY56jeeZua20S+luoz1jgNxfRW
         ITyqvmlwjeoUc5w5RWJbTdroqs5FpoJKaO+1x21gcr2Hu7Vjdk3fTXrvgibSJ5GK16qZ
         i3mI9oevbF7PESO8NFbtpuPPlDX+cKV00LDrObO7WqQhuGTQ4fQxyloKa2WD81NR7OYj
         Aoe946tOKWfTZxNhjLxmLw4VlYiYZQbZLdws8zajn0v0ynaIiZ1N6rjm6UnS/H0x51GY
         iwzg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787437652; x=1788042452; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h2KBP7bJOZESyKVN512DplqH6zyDbmVZ0g4qOVUEItw=;
        b=RwZ4ib7PLfl9Cdr+PK2jW20Ylo2MNM+ZDGoOQbxtsCW+bz5hhvAX/FuZ44Fk5bHvYu
         zxkIn0qkmZ0+m0iSUzud0XSISIOn+2CdFK5CRwrc6JlqwuCLhggZohcUS1zgfLU/uEr/
         9D2mzLHaCNYbVoTmcNb9JpIne+MvRoCj/zK2EBjyYBA+kPbu3rokKo9/sAYsiFhKBsGP
         B5mGZJZFNMna36ZsM2jtuiPydFsLzCkQIOXxu0tQ6V4MYOngmEIA1p9DEsXvFeuS+bFZ
         CAF7SZxnVkL+191ii0KY55RJjQoE2lnNJkkbxY7x0u+6nYppG0E5ck4fi8D4rI01Uo2Q
         sqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787437652; x=1788042452;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h2KBP7bJOZESyKVN512DplqH6zyDbmVZ0g4qOVUEItw=;
        b=suHl8rTQFlft+ejyqUpXULt01AW9i+L0iOJTFo5KUlWxUzw/w8zZvgCYSS9tjKLHJs
         W4bh7O9My+h3PGEkBIPEBl8hCJ7+DDgf/W2l36eQlDK/jJVVOxf2/IZ4JSFrncjohBjn
         bKnpIlrTBJ4c9EMNlDArTsPgkhTdwQGdtGJCUKsj5pH9YBlW6aKkYkTlQNN8iLveOCAS
         WT7rKJI/jIwI0Tgs7V5o8j4JZp36zTkh5D1r0Um97w5dfzeWZoytMATl/BjTLxzW//gX
         BUHqv5nChISX5vC9j+p+N6ygfL7IpPUhSP9TmZBHaiJonfLQConISP7qW0z6YVEBnxG9
         GsZA==
X-Forwarded-Encrypted: i=1; AHgh+Rp3i/eQEuywqzAq9nhi74XqS5za4eXxu1iUmxW5fl0CcQTuj80nsN4B3n3zMPGIrJITLwbilnI=@lists.linux.dev
X-Gm-Message-State: AFuF++mXroytQnCqWDYaJcU3j6YoIQE6ZAfeNXI+ezqKcUfErSEYrbVA
	LMI6ZeLheoaQSNvSOii2HaRp5l6QmKzVhaUONVXHIapvXVAi8Ilc2wtgbtkViZtyxs+ulKxgaKj
	7sLF1YonzA+a1S24oCg44wQ/uu/rOs3Q=
X-Gm-Gg: AR+sD115LP1ayl+WXvFKbjncRxk3R1plKspSiNmJdc0EnIyEOcw2CDRfDxfCuAbC5pK
	Mk/wL2iKJMNyW1GYDlruLElIYClo2aNDKzpIoYyq0m+bjm7q+2iGh89g2O7uXPGzgVasm4c4tPI
	RL429ARykPYuQEhqvepJfnssWm+tjpe7kVx2GqXcCdrzVllLSd8xqyEDxwvYLCR4ThRy8YuO7v4
	U1R4ErGnCT6H+BR9yk/iHeTahH8k4JLr69YxzCopGfUdy3ekzZgWiSFjx+RKVUpqMOmo2/txIg8
	FfI1ENgDsbxTUITFvWrSew4gfl/Pu33v7K7HEtzcoyUEGj/inOebkJeGdrpmOnaFD4UjwcJ2RnP
	etvUC/cq23duLcqzyWn6dDipqn4fSExDWizu6nR7z6An+Q20T8NifNA8H/f7p3uN9nCfAt968uy
	PAod5YJvbo4EasPzA=
X-Received: by 2002:a17:90b:3b4d:b0:38d:ef48:b04 with SMTP id
 98e67ed59e1d1-395c39b1750mr25888560a91.10.1787437652530; Sat, 22 Aug 2026
 15:27:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260813074810.27574-1-phucduc.bui@gmail.com> <20260822023959.4319f0c3@jic23-huawei>
In-Reply-To: <20260822023959.4319f0c3@jic23-huawei>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 23 Aug 2026 05:27:21 +0700
X-Gm-Features: AcwNN1XUh84KX3jaBPa7kHJp99hE9mYWPs2QfVJIdkLloGc_YiaGMghuVA1RL-I
Message-ID: <CAABR9nFdnFH-gspxEZffAb13_vvrs+x4Ksznq5JFO1gMEmw4_Q@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: sophgo-saradc: Handle errors from optional IRQ lookup
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, nuno.sa@analog.com, 
	Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>, u.kleine-koenig@baylibre.com, 
	Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-iio@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

Thank you for your feedback.

> >
> > platform_get_irq_optional() returns a positive IRQ number on success or
> > a negative error code on failure. For an optional IRQ, -ENXIO indicates
> > that no optional IRQ is available. Other errors, such as -EPROBE_DEFER
> > and -EINVAL, should be propagated so that the caller can handle them
> > appropriately.
>
> That function is very much undocumented other than not printing a
> message when it returns an error.  However I think you analysis is
> correct.
>

Yes, I agree. The documentation for this function may not be clear enough,
which could have led to error handling being implemented incorrectly
in some places.

There is also an inconsistency in this driver: if devm_request_irq() fails,
the error is returned and the probe fails. But if platform_get_irq_optional()
fails, the error is ignored.
I'm not sure whether the author misunderstood and assumed that any
negative return value simply means that there is no IRQ.

> I'm not going to rush this is because it is not known to have
> been a problem in the wild (only odd loading orders should have
> caused deferal).
>

I understand your point. However, in this case the error can be
completely hidden:
There is no error message or log, the error is not returned, and the
driver falls back
to polling:
-----------------------------------
if (saradc->irq < 0) {
        u32 reg;

        return readl_poll_timeout(saradc->regs + CV1800B_ADC_STATUS_REG,
                                                 reg, !(reg & CV1800B_ADC_BUSY),
                                                 500, CV1800B_READ_TIMEOUT_US);
}
------------------------------------

So there may never be an obvious failure for a user to report.

Best regards,
Phuc
